const products = [
  {
    name: 'HP Essentials 255 G8',
    price: 289,
    stars: 4,
    reviews: 250,
    seller: 'RodriComponentes',
    image:
      'https://www.tradeinn.com/f/13856/138567956_4/hp-portatil-essential-255-g8-15.6-r3-5300u-8gb-256gb-ssd.webp'
  },
  {
    name: 'Lenovo IdeaPad 3',
    price: 450,
    stars: 5,
    reviews: 320,
    seller: 'RodriComponentes',
    image:
      'https://eshopfrontend.orange.es/dw/image/v2/BJWB_PRD/on/demandware.static/-/Sites-devices-master-catalog/default/dwf3f35f3d/images/3710926/lenovo_ideapad_3_15itl6_gris_Front.png?sw=1440&sh=1080&sm=fit'
  },
  {
    name: 'Apple MacBook Air',
    price: 999,
    stars: 5,
    reviews: 800,
    seller: 'RodriComponentes',
    image:
      'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/mba13-skyblue-select-202503?wid=892&hei=820&fmt=jpeg&qlt=90&.v=M2RyY09CWXlTQUp1KzEveHR6VXNxcTQ1bzN1SitYTU83Mm9wbk1xa1lWN2h4SGtCQ2R3aStVaDRhL2VUV1NjdkJkRlpCNVhYU3AwTldRQldlSnpRa0lIV0Fmdk9rUlVsZ3hnNXZ3K3lEVlk'
  },
  {
    name: 'Asus TUF Gaming F15',
    price: 850,
    stars: 4,
    reviews: 450,
    seller: 'RodriComponentes',
    image:
      'https://www.kyotoelectrodomesticos.com/media/catalog/product/cache/8f0f67e4f762f76607ad37dd5bb0bb16/1/2/123448df046b80c2a526dea3927f12b8c3717e_1.jpg'
  },
  {
    name: 'Microsoft Surface Laptop 5',
    price: 1100,
    stars: 5,
    reviews: 150,
    seller: 'RodriComponentes',
    image:
      'https://ultimainformatica.com/1602235-thickbox_default/microsoft-surface-laptop-5-portatil-343-cm-135-pantalla-tactil-intel-core-i5-i5-1245u-16-gb-lpddr5x-sdram-256-gb-ssd-wi-fi-6.jpg'
  },
  {
    name: 'Dell XPS 13',
    price: 1250,
    stars: 4,
    reviews: 210,
    seller: 'RodriComponentes',
    image:
      'https://ecoportatil.es/17165-medium_default/dell-xps-13-7390-133-i7-10510u-16gb-ssd-512gb-full-hd-a.jpg'
  },
  {
    name: 'Acer Chromebook 314',
    price: 230,
    stars: 3,
    reviews: 180,
    seller: 'RodriComponentes',
    image:
      'https://m.media-amazon.com/images/I/51ztYY6EWEL._UF894,1000_QL80_.jpg'
  },
  {
    name: 'MSI Katana 15',
    price: 950,
    stars: 4,
    reviews: 300,
    seller: 'RodriComponentes',
    image:
      'https://tienda.ecomputer.es/22883-large_default/portatil-msi-katana-15-487xes-ci7-13620h-32gb-1tb-ssd-rtx-4060-8gb-156-ips-144hz-freedos-black-9s7-158571-487.jpg'
  },
  {
    name: 'Gigabyte AERO 16',
    price: 1800,
    stars: 5,
    reviews: 90,
    seller: 'RodriComponentes',
    image:
      'https://ultimainformatica.com/2207424-thickbox_default/gigabyte-aero-16-xe5-73pt938hp-portatil-406-cm-16-quad-hd-intel-core-i7-i7-12700h-16-gb-ddr5-sdram-2-tb-ssd-nvidia-geforce-rtx.jpg'
  },
  {
    name: 'Razer Blade 15',
    price: 2100,
    stars: 5,
    reviews: 120,
    seller: 'RodriComponentes',
    image:
      'https://codegeek.es/wp-content/uploads/2022/05/4zu3_Razer_Blade_15_Advanced_Model_2020.jpg'
  },
  {
    name: 'Samsung Galaxy Book3',
    price: 650,
    stars: 4,
    reviews: 110,
    seller: 'RodriComponentes',
    image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScwPLewEHjR5BC8ANjydiYyMSEC3JMLrQLZA&s'
  },
  {
    name: 'LG Gram 16',
    price: 1300,
    stars: 5,
    reviews: 180,
    seller: 'RodriComponentes',
    image:
      'https://m.media-amazon.com/images/I/8178ueVHwPL._UF894,1000_QL80_.jpg'
  }
]

const renderProducts = (productsToRender) => {
  const productContainer = document.getElementById('products-section')
  productContainer.innerHTML = ''

  productsToRender.forEach((product) => {
    const productCardHTML = `
      <article class="product-card">
        <img src="${product.image}" alt="${product.name}">
        <div class="product-card-info">
          <h3>${product.name}</h3>
          <p class="price">${product.price} €</p>
          <p class="seller">Vendido por: <strong>${product.seller}</strong></p>
        </div>
      </article>
    `
    productContainer.innerHTML += productCardHTML
  })
}

const applyFilters = () => {
  let filteredProducts = [...products]

  const searchTerm = document.getElementById('search-input').value.toLowerCase()
  if (searchTerm) {
    filteredProducts = filteredProducts.filter((product) =>
      product.name.toLowerCase().includes(searchTerm)
    )
  }

  const selectedPriceRange = document.querySelector(
    'input[name="price"]:checked'
  ).value
  if (selectedPriceRange !== 'all') {
    const [min, max] = selectedPriceRange.split('-')
    filteredProducts = filteredProducts.filter((product) => {
      const price = product.price
      if (max) {
        return price >= parseInt(min) && price <= parseInt(max)
      } else {
        return price >= parseInt(min)
      }
    })
  }

  renderProducts(filteredProducts)
}

document.addEventListener('DOMContentLoaded', () => {
  renderProducts(products)

  document
    .getElementById('search-input')
    .addEventListener('input', applyFilters)

  document
    .querySelectorAll('input[name="price"]')
    .forEach((radio) => radio.addEventListener('change', applyFilters))
})
