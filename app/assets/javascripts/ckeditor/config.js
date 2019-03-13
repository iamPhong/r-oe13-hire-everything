CKEDITOR.editorConfig = function (config) {
  config.toolbar = [
    { name: 'basicstyles', items : [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
    { name: 'styles', items : [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'paragraph', items : [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
      'JustifyBlock', '-', 'NumberedList', 'BulletedList', 'Outdent', 'Indent' ] }
  ];
  config.height = 250;
}
