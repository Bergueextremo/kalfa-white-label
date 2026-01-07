export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "13.0.5"
  }
  public: {
    Tables: {
      auditorias_contratos: {
        Row: {
          ai_result_json: Json | null
          appmax_order_id: string | null
          contract_type: string | null
          created_at: string
          file_path: string
          id: string
          payment_metadata: Json | null
          payment_status: string | null
          potential_savings: number | null
          score_vantagem: number | null
          status: Database["public"]["Enums"]["auditoria_status"]
          updated_at: string | null
          user_id: string
        }
        Insert: {
          ai_result_json?: Json | null
          appmax_order_id?: string | null
          contract_type?: string | null
          created_at?: string
          file_path: string
          id?: string
          payment_metadata?: Json | null
          payment_status?: string | null
          potential_savings?: number | null
          score_vantagem?: number | null
          status?: Database["public"]["Enums"]["auditoria_status"]
          updated_at?: string | null
          user_id: string
        }
        Update: {
          ai_result_json?: Json | null
          appmax_order_id?: string | null
          contract_type?: string | null
          created_at?: string
          file_path?: string
          id?: string
          payment_metadata?: Json | null
          payment_status?: string | null
          potential_savings?: number | null
          score_vantagem?: number | null
          status?: Database["public"]["Enums"]["auditoria_status"]
          updated_at?: string | null
          user_id?: string
        }
        Relationships: []
      }
      chat_leads: {
        Row: {
          created_at: string
          email: string
          id: string
          name: string
          whatsapp: string
        }
        Insert: {
          created_at?: string
          email: string
          id?: string
          name: string
          whatsapp: string
        }
        Update: {
          created_at?: string
          email?: string
          id?: string
          name?: string
          whatsapp?: string
        }
        Relationships: []
      }
      credit_purchases: {
        Row: {
          amount: number
          appmax_order_id: string | null
          created_at: string
          credits: number
          id: string
          payment_metadata: Json | null
          payment_method: string
          payment_status: string | null
          updated_at: string
          user_id: string
        }
        Insert: {
          amount: number
          appmax_order_id?: string | null
          created_at?: string
          credits: number
          id?: string
          payment_metadata?: Json | null
          payment_method: string
          payment_status?: string | null
          updated_at?: string
          user_id: string
        }
        Update: {
          amount?: number
          appmax_order_id?: string | null
          created_at?: string
          credits?: number
          id?: string
          payment_metadata?: Json | null
          payment_method?: string
          payment_status?: string | null
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
      pending_activations: {
        Row: {
          created_at: string
          email: string
          id: string
          name: string
          token: string
        }
        Insert: {
          created_at?: string
          email: string
          id?: string
          name: string
          token: string
        }
        Update: {
          created_at?: string
          email?: string
          id?: string
          name?: string
          token?: string
        }
        Relationships: []
      }
      profiles: {
        Row: {
          created_at: string
          credits: number
          document: string | null
          email: string
          id: string
          name: string
          role: Database["public"]["Enums"]["app_role"]
          whatsapp: string | null
        }
        Insert: {
          created_at?: string
          credits?: number
          document?: string | null
          email: string
          id: string
          name: string
          role?: Database["public"]["Enums"]["app_role"]
          whatsapp?: string | null
        }
        Update: {
          created_at?: string
          credits?: number
          document?: string | null
          email?: string
          id?: string
          name?: string
          role?: Database["public"]["Enums"]["app_role"]
          whatsapp?: string | null
        }
        Relationships: []
      }
      user_roles: {
        Row: {
          id: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Insert: {
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Update: {
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      app_role: "admin" | "moderator" | "user"
      auditoria_status: "UPLOADING" | "PROCESSING" | "COMPLETED" | "FAILED"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DefaultSchema = Database["public"]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
  | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
  | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? keyof (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
    Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
  : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
    Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
  ? R
  : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
    DefaultSchema["Views"])
  ? (DefaultSchema["Tables"] &
    DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
      Row: infer R
    }
  ? R
  : never
  : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
  | keyof DefaultSchema["Tables"]
  | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
  : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
    Insert: infer I
  }
  ? I
  : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
  ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
    Insert: infer I
  }
  ? I
  : never
  : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
  | keyof DefaultSchema["Tables"]
  | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
  : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
    Update: infer U
  }
  ? U
  : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
  ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
    Update: infer U
  }
  ? U
  : never
  : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
  | keyof DefaultSchema["Enums"]
  | { schema: keyof Database },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof Database
  }
  ? keyof Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
  : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof Database
}
  ? Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
  ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
  : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
  | keyof DefaultSchema["CompositeTypes"]
  | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
  ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
  : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof Database
}
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
  ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
  : never

export const Constants = {
  public: {
    Enums: {
      app_role: ["admin", "moderator", "user"],
      auditoria_status: ["UPLOADING", "PROCESSING", "COMPLETED", "FAILED"],
    },
  },
} as const
