import { Card, CardContent } from "@/components/ui/card";
import { LucideIcon } from "lucide-react";

interface MetricCardProps {
    title: string;
    value: string | number;
    icon: LucideIcon;
    trend?: {
        value: number;
        isPositive: boolean;
    };
    prefix?: string;
    suffix?: string;
}

export const MetricCard = ({
    title,
    value,
    icon: Icon,
    trend,
    prefix = "",
    suffix = ""
}: MetricCardProps) => {
    return (
        <Card>
            <CardContent className="p-6">
                <div className="flex items-center justify-between">
                    <div className="flex-1">
                        <p className="text-sm font-medium text-muted-foreground mb-1">
                            {title}
                        </p>
                        <h3 className="text-3xl font-bold">
                            {prefix}{value}{suffix}
                        </h3>
                        {trend && (
                            <p className={`text-sm mt-2 flex items-center gap-1 ${trend.isPositive ? 'text-green-600' : 'text-red-600'
                                }`}>
                                <span>{trend.isPositive ? '↑' : '↓'}</span>
                                <span>{Math.abs(trend.value)}%</span>
                                <span className="text-muted-foreground">vs período anterior</span>
                            </p>
                        )}
                    </div>
                    <div className="ml-4">
                        <div className="p-3 bg-primary/10 rounded-lg">
                            <Icon className="h-6 w-6 text-primary" />
                        </div>
                    </div>
                </div>
            </CardContent>
        </Card>
    );
};
