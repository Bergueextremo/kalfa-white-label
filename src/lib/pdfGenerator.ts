import { jsPDF } from 'jspdf';
import { Contract } from '@/components/catalog/types';
import { generateRobustContract } from './contractGenerator';
import DOMPurify from 'dompurify';

export const downloadContractPDF = async (contract: Contract, variables: Record<string, string>) => {
    // 1. Generate the HTML content with filled variables
    const htmlContent = generateRobustContract(contract, variables);

    // 2. Clean the HTML
    const cleanHtml = DOMPurify.sanitize(htmlContent);

    // 3. Create a hidden container to render the HTML for the PDF engine
    const container = document.createElement('div');
    container.style.width = '190mm'; // Standard A4 minus margins
    container.style.padding = '10mm';
    container.style.position = 'absolute';
    container.style.left = '-9999px';
    container.style.top = '0';
    container.style.backgroundColor = 'white';
    container.style.color = 'black';
    container.style.fontSize = '11pt';
    container.style.fontFamily = 'serif';
    container.style.lineHeight = '1.5';
    container.style.textAlign = 'justify';

    // Inject CSS for the PDF look
    container.innerHTML = `
        <style>
            .contract-wrapper h1 { font-size: 16pt; font-weight: bold; text-align: center; margin-bottom: 20px; }
            .contract-wrapper h2 { font-size: 14pt; font-weight: bold; text-align: center; margin-bottom: 30px; }
            .contract-wrapper h3 { font-size: 12pt; font-weight: bold; margin-top: 25px; margin-bottom: 10px; border-bottom: 1px solid #ccc; padding-bottom: 5px; }
            .contract-wrapper p { margin-bottom: 12px; }
            .contract-wrapper strong { font-weight: bold; }
            .contract-wrapper .user-content { margin: 30px 0; }
        </style>
        <div class="contract-wrapper">
            ${cleanHtml}
        </div>
    `;

    document.body.appendChild(container);

    try {
        const doc = new jsPDF({
            format: 'a4',
            unit: 'mm',
        });

        // Use the html method
        await doc.html(container, {
            callback: function (doc) {
                doc.save(`${contract.slug}_assinado.pdf`);
            },
            x: 10,
            y: 10,
            width: 190,
            windowWidth: 800 // Virtual window width to maintain scale
        });

    } catch (error) {
        console.error("Error generating PDF:", error);
    } finally {
        // Cleanup
        document.body.removeChild(container);
    }
};
