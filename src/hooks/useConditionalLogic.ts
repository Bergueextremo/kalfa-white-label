import { useMemo, useCallback } from 'react';
import { ContractVariable, VisibilityRule } from '@/components/catalog/types';

interface UseConditionalLogicResult {
    isVisible: (variable: ContractVariable) => boolean;
    getVisibleVariables: (variables: ContractVariable[]) => ContractVariable[];
    getHiddenFieldNames: (variables: ContractVariable[]) => string[];
}

/**
 * Evaluates a single visibility rule against current form data
 */
function evaluateRule(rule: VisibilityRule, formData: Record<string, string>): boolean {
    const dependencyValue = formData[rule.dependsOn] || '';

    switch (rule.operator) {
        case 'equals':
            if (Array.isArray(rule.value)) {
                return rule.value.includes(dependencyValue);
            }
            return dependencyValue === rule.value;

        case 'not_equals':
            if (Array.isArray(rule.value)) {
                return !rule.value.includes(dependencyValue);
            }
            return dependencyValue !== rule.value;

        case 'contains':
            if (Array.isArray(rule.value)) {
                return rule.value.some(v => dependencyValue.toLowerCase().includes(v.toLowerCase()));
            }
            return dependencyValue.toLowerCase().includes((rule.value || '').toLowerCase());

        case 'is_empty':
            return !dependencyValue || dependencyValue.trim() === '';

        case 'is_not_empty':
            return !!dependencyValue && dependencyValue.trim() !== '';

        default:
            return true; // Unknown operator = show by default
    }
}

/**
 * Hook for conditional field visibility logic
 * 
 * @param formData - Current form values
 * @returns Object with visibility check functions
 */
export function useConditionalLogic(formData: Record<string, string>): UseConditionalLogicResult {

    const isVisible = useCallback((variable: ContractVariable): boolean => {
        // No rule = always visible
        if (!variable.visibility_rule) return true;

        return evaluateRule(variable.visibility_rule, formData);
    }, [formData]);

    const getVisibleVariables = useCallback((variables: ContractVariable[]): ContractVariable[] => {
        return variables.filter(v => isVisible(v));
    }, [isVisible]);

    const getHiddenFieldNames = useCallback((variables: ContractVariable[]): string[] => {
        return variables.filter(v => !isVisible(v)).map(v => v.name);
    }, [isVisible]);

    return useMemo(() => ({
        isVisible,
        getVisibleVariables,
        getHiddenFieldNames
    }), [isVisible, getVisibleVariables, getHiddenFieldNames]);
}

/**
 * Cleans form data by removing values of hidden fields
 * Use this before generating the final contract to avoid stale data
 */
export function cleanFormData(
    formData: Record<string, string>,
    variables: ContractVariable[]
): Record<string, string> {
    const result: Record<string, string> = {};

    for (const variable of variables) {
        const value = formData[variable.name];

        // Only include visible fields
        if (!variable.visibility_rule) {
            result[variable.name] = value || '';
        } else if (evaluateRule(variable.visibility_rule, formData)) {
            result[variable.name] = value || '';
        }
        // Hidden fields are excluded (cleaned)
    }

    return result;
}
