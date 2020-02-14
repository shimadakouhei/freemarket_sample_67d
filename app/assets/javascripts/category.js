$(function(){
  const buildCategoryHTML = (category) => {
    const html = `  
                  
    <option value=${category.category_id}>${category.category_name}</option>
    `

                    
    return html;
  }
  
  $(document).on('change', '.js-category', function(){
    let category_id = $(this).val();
    $(this).nextAll().remove()
    $.ajax({
      type: "GET",
      url: " /api/categories",
      data: { keyword: category_id },
      dataType: "json"
    })
    .done(function(categories){
      if (categories.length !== 0) {
        var insertHTML = '';
         //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
         $.each(categories, function(i, category) {
           insertHTML += buildCategoryHTML(category)
         });
         $('.js-category_box').append(`<select name="product[category_id]" class="js-category">${insertHTML}</select>`)
        }
    })
    .fail(function(){

    })

  })

})