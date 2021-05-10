ActiveAdmin.register Product do
  permit_params :title, :description, :price, :category_id, images: []

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :description
      f.input :price
      f.input :images, as: :file, input_html: { multiple: true }
      actions
    end
  end

  show do
    attributes_table do
      row :category
      row :title
      row :description
      row :price
      row :images do
        ul do
          product.images.each do |img|
            li do
              image_tag(img, size: "300x300")
            end
          end
        end
      end
    end
  end
end
