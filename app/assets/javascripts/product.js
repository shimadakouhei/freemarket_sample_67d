$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `
                    <div data-index="${index}" class="js-file_group">
                    <div class="js-remove">削除</div>
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                    
                    </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.exhibition__contents__main__middle__heart__upload-box__title').on('change', '.js-file', function(e) {
    console.log('hello');
    // fileIndexの先頭の数字を使ってinputを作る
    $('.exhibition__contents__main__middle__heart__upload-box__title').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.exhibition__contents__main__middle__heart__upload-box__title').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('.exhibition__contents__main__middle__heart__upload-box__title').append(buildFileField(fileIndex[0]));
  });
  $('#aa_theme').on('change',function(){
    console.log('hello');
  });
});