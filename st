export const schemaTypes = [
  {
    name: "shoe",
    title: "Shoes",
    type: "document",
    fields: [
      {
        name: "orderNumber",
        title: "Order Number",
        type: "number",
        description: "Number to control the display order of products (lower numbers appear first)",
        validation: (Rule: any) => Rule.required().integer().min(0),
      },
      {
        name: "productName",
        title: "Shoe Name",
        type: "string",
      },
      {
        name: "shoeBrand",
        title: "Shoe Brand",
        type: "string",
      },
      {
        name: "category",
        title: "Shoe Category",
        type: "string",
        options: {
          list: [
            { title: "Sneakers", value: "sneakers" },
            { title: "Boots", value: "boots" },
            { title: "Sandals", value: "sandals" },
            { title: "Loafers", value: "loafers" },
            { title: "Sports Shoes", value: "sports-shoes" },
            { title: "Formal Shoes", value: "formal-shoes" },
          ],
        },
      },
      {
        name: "sizes",
        title: "Available Sizes",
        type: "array",
        of: [{ type: "number" }],
        options: {
          list: [6, 7, 8, 9, 10], // Default sizes
        },
        initialValue: [6, 7, 8, 9, 10], // Pre-filled with all sizes
      },
      {
        name: "colorVariants",
        title: "Color Variants",
        type: "array",
        of: [{ type: "string" }],
      },
      {
        name: "tags",
        title: "Tags",
        type: "array",
        of: [{ type: "string" }],
        options: {
          layout: "tags",
        },
      },
      {
        name: "images",
        title: "Upload Images",
        type: "array",
        of: [{ type: "image" }],
        options: {
          layout: "grid",
        },
      },
      {
        name: "description",
        title: "Description",
        type: "text",
      },
      {
        name: "madeIn",
        title: "Country of Origin",
        type: "string",
      },
      {
        name: "price",
        title: "Price",
        type: "number",
      },
      {
        name: "isOffer",
        title: "Is on Offer?",
        type: "boolean",
      },
      {
        name: "offerPrice",
        title: "Offer Price",
        type: "number",
        hidden: ({ document }: any) => !document?.isOffer, // Hides if isOffer is false
      },
      {
        name: "buyOneGetOne",
        title: "Buy 1 Get 1 Free?",
        type: "boolean",
      },
      {
        name: "stock",
        title: "Stock Availability",
        type: "number",
      },
      {
        name: "isDisabled",
        title: "Disable Product",
        type: "boolean",
        description: "When enabled, this product will be hidden from the website",
        initialValue: false,
      },
      {
        name: "disableReason",
        title: "Reason for Disabling",
        type: "string",
        description: "Optional: Enter the reason why this product is disabled",
        hidden: ({ document }: any) => !document?.isDisabled,
        options: {
          list: [
            { title: "Out of Stock", value: "out-of-stock" },
            { title: "Seasonal", value: "seasonal" },
            { title: "Discontinued", value: "discontinued" },
            { title: "Quality Issues", value: "quality-issues" },
            { title: "Other", value: "other" },
          ],
        },
      },
    ],
    orderings: [
      {
        title: 'Order Number, Asc',
        name: 'orderNumberAsc',
        by: [
          {field: 'orderNumber', direction: 'asc'}
        ]
      },
      {
        title: 'Disabled Products First',
        name: 'disabledFirst',
        by: [
          {field: 'isDisabled', direction: 'desc'},
          {field: 'orderNumber', direction: 'asc'}
        ]
      }
    ]
  },
];