import { jsPDF } from 'jspdf';
import { Contract } from '@/components/catalog/types';
import { generateRobustContract } from './contractGenerator';
import DOMPurify from 'dompurify';

export const downloadContractPDF = async (contract: Contract, variables: Record<string, string>) => {
    // 1. Generate the HTML content with filled variables
    const htmlContent = generateRobustContract(contract, variables);

    console.log("Generating PDF for:", contract.title);

    // 2. Clean the HTML
    const cleanHtml = DOMPurify.sanitize(htmlContent);

    // 3. Create a container structure
    // We need the content to be "visible" for html2canvas to capture it,
    // but we don't want the USER to see the raw document flashing.
    // Solution: A container with z-index 99999, containing:
    //    a) A "Loading" overlay on top (z-index 2)
    //    b) The Contract content below (z-index 1)
    const exteriorContainer = document.createElement('div');
    exteriorContainer.id = 'pdf-generation-root';
    exteriorContainer.style.position = 'fixed';
    exteriorContainer.style.top = '0';
    exteriorContainer.style.left = '0';
    exteriorContainer.style.width = '100vw';
    exteriorContainer.style.height = '100vh';
    exteriorContainer.style.zIndex = '99999';
    exteriorContainer.style.backgroundColor = 'white';

    // Inject CSS
    exteriorContainer.innerHTML = `
        <style>
            /* Loading Overlay Styles */
            .pdf-loading-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background: white !important;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                z-index: 2147483647; /* Max Z-Index available */
            }
            .loading-spinner {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #3498db;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                animation: spin 1s linear infinite;
                margin-bottom: 20px;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
            .loading-text {
                font-family: sans-serif;
                color: #333;
                font-size: 16px;
                font-weight: 500;
            }

            /* Paper Styles - Match Google Docs format */
            .pdf-render-ctx {
                position: absolute;
                top: 0;
                left: 0;
                width: 595px; /* A4 width at 72 DPI (standard PDF DPI) */
                z-index: 1; 
                visibility: visible;
            }
            
            .paper-sheet { 
                background: white; 
                width: 595px; /* A4 at 72 DPI */
                min-height: 842px; /* A4 height at 72 DPI */
                padding: 72px !important; /* 1 inch = 72px at 72 DPI (standard margin) */
                box-sizing: border-box; 
                color: black !important;
                margin: 0;
                /* Match Google Docs default: Arial 11pt */
                font-family: Arial, Helvetica, sans-serif;
                font-size: 11pt;
                line-height: 1.15;
            }
            .paper-sheet * {
                box-sizing: border-box;
            }
            .paper-sheet h1 { font-size: 14pt !important; font-weight: bold; text-align: center; margin-bottom: 12pt; color: #000 !important; }
            .paper-sheet h2 { font-size: 12pt !important; font-weight: bold; text-align: center; margin-bottom: 10pt; color: #000 !important; }
            .paper-sheet h3 { font-size: 11pt !important; font-weight: bold; margin-top: 12pt; margin-bottom: 6pt; border-bottom: 1px solid #000; padding-bottom: 2pt; text-transform: uppercase; color: #000 !important; }
            .paper-sheet p { font-size: 11pt !important; line-height: 1.15; margin-bottom: 6pt; text-align: justify; color: #000 !important; }
            .paper-sheet strong { font-weight: bold; color: #000 !important; }
            .paper-sheet .user-content { margin: 6pt 0; color: #000 !important; }
            .paper-sheet .user-content * { color: #000 !important; font-size: 11pt !important; line-height: 1.15 !important; }
        </style>

        <!-- Loading Screen (Visible to User) -->
        <div class="pdf-loading-overlay">
            <div class="loading-spinner"></div>
            <div class="loading-text">Gerando documento...</div>
            <div style="font-size: 12px; color: #666; margin-top: 5px">Aguarde, não feche esta página.</div>
        </div>

        <!-- content to capture (Hidden by overlay but rendered) -->
        <div class="pdf-render-ctx">
            <div id="pdf-content-source" class="paper-sheet">
                ${cleanHtml}
            </div>
        </div>
    `;

    document.body.appendChild(exteriorContainer);

    // Give the browser a moment to paint
    await new Promise(resolve => setTimeout(resolve, 1000));

    try {
        // A4 at 72 DPI = 595 x 842 pixels
        // jsPDF default unit is 'pt' which is 1/72 inch, so 595pt = 595px at 72 DPI
        const doc = new jsPDF({
            orientation: 'p',
            unit: 'pt',
            format: 'a4',
            compress: true
        });

        const element = document.getElementById('pdf-content-source');
        if (!element) throw new Error("Source element not found");

        await doc.html(element, {
            callback: function (doc) {
                doc.save(`${contract.slug}_assinado.pdf`);
                setTimeout(() => {
                    if (exteriorContainer.parentNode) document.body.removeChild(exteriorContainer);
                }, 500);
            },
            x: 0,
            y: 0,
            // 595px element -> 595pt PDF (1:1 mapping at 72 DPI)
            width: 595,
            windowWidth: 595,
            autoPaging: 'text',
            html2canvas: {
                scale: 1, // NO SCALING - 1:1 pixel to point ratio
                useCORS: true,
                logging: false,
                scrollY: 0,
                windowWidth: 595
            }
        });

    } catch (error) {
        console.error("Error generating PDF:", error);
        if (exteriorContainer.parentNode) document.body.removeChild(exteriorContainer);
    }
};
