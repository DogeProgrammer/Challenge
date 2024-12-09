export interface ProductWithVariants {
  name: string;
  brand: string;
  stock: number;
  price: number;
  upfront: number;
  is_new: boolean;
  discount: number;
  colors: OptionValue[];
  storage: OptionValue[];
  variants: Variant[];
}

interface OptionValue {
  id: number;
  value: string;
}

export interface Variant {
  color_option_id: number;
  color_option_value_id: number;
  color_option_value: string;
  storage_option_id: number;
  storage_option_value_id: number;
  storage_option_value: string;
  property_id: number;
  stock: number;
  price: number;
  upfront: number;
  image: string;
}

export interface Product {
  id: number;
  name: string;
  price: number;
  upfront: number;
  image: string;
  created_at: string;
  updated_at: string;
  category: string;
  stock: number;
  discount: number;
  brand: string;
  colors: OptionValue[];
  is_new: boolean;
}
