from odoo_image_fetcher import ImageFetcher

image_bytes = ImageFetcher.fetch_image("/web/image/product.template/17956/image_128")
if image_bytes:
    with open("product_image.png", "wb") as f:
        f.write(image_bytes)
    print("✅ Image saved.")
else:
    print("❌ Image fetch failed.")
