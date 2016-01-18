$(function() {
  // 初期状態では表示されないものを隠す
  $('.default-hide').hide()

  // プラスボタンが押されたときにフォームを追加する
  $('.image-upload-plus').click(function() {
    $(this).hide()

    var parent = $(this).parent()
    var uploadForm = parent.find('.image-upload')
    uploadForm.show()
  })

  // 投稿する画像が選択されたときにプレビューを表示する
  $('.preview-uploaded-image').each(function() {
    var self = $(this)
    var input = self.find('input[type=file]')

    input.change(function() {
      var file = $(this).prop('files')[0]
      var fileReader = new FileReader()

      if (!this.files.length) {
        return
      }

      if (!file.type.match('image.*')) {
        return
      }

      fileReader.onload = function() {
        self.css({
          'background-image': 'url(' + fileReader.result + ')',
          'background-size': 'contain'
        })
      }
      fileReader.readAsDataURL(file)
    })
  })
})
