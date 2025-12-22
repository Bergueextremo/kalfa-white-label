export interface Category {
    id: string;
    name: string;
    slug: string;
    icon: string | null;
    description: string | null;
    parent_id: string | null;
}

export interface Contract {
    id: string;
    title: string;
    slug: string;
    description: string | null;
    full_description: string | null;
    category_id: string;
    price: number;
    template_body: string | null;
    wizard_stages: string[] | null;
    is_active?: boolean;
}

export interface ContractVariable {
    id: string;
    contract_id: string;
    name: string;
    label: string;
    type: string;
    options: string[] | null;
    required: boolean;
    group_name: string | null;
    order_index: number;
}
