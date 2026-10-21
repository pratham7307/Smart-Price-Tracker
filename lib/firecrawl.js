import FirecrawlApp from "@mendable/firecrawl-js";

export async function scrapeProduct(url) {
  const apiKey = process.env.FIRECRAWL_API_KEY;

  if (!apiKey || apiKey.includes("your-")) {
    throw new Error(
      "FIRECRAWL_API_KEY is not configured or is still set to placeholder. Please set a valid FIRECRAWL_API_KEY in .env.local"
    );
  }

  const firecrawl = new FirecrawlApp({
    apiKey,
  });

  try {
    const result = await firecrawl.scrapeUrl(url, {
      formats: ["extract"],
      extract: {
        prompt:
          "Extract the product name as 'productName', current price as a number as 'currentPrice', currency code (USD, EUR, etc) as 'currencyCode', and product image URL as 'productImageUrl' if available",
        schema: {
          type: "object",
          properties: {
            productName: { type: "string" },
            currentPrice: { type: "number" },
            currencyCode: { type: "string" },
            productImageUrl: { type: "string" },
          },
          required: ["productName", "currentPrice"],
        },
      },
    });

    if (!result || result.success === false) {
      throw new Error(result?.error || "Failed to extract product data from URL");
    }

    // Firecrawl returns data in result.extract
    const extractedData = result.extract;

    if (!extractedData || !extractedData.productName) {
      throw new Error("Could not find product details on this page");
    }

    return extractedData;
  } catch (error) {
    console.error("Firecrawl scrape error:", error);
    throw new Error(`Failed to scrape product: ${error.message}`);
  }
}
