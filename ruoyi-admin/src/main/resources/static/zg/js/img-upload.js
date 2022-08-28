(function ($) {
    $.extend({
        imageUpload: {
            init: function (options) {
                var defaultValue = {
                    element: "imgUpload",
                    height: "100",
                    width: "100",
                    accept: "image/*",
                    maxNum: 3,
                    uploaded: 0,
                    imgSrc: [],
                    uploadUrl: ''
                };
                var options = $.extend(defaultValue, options);
                $.imageUpload.initEvent(options);
            },
            getObjectURL: function (file) {
                //建立可存取到file的url
                var url = null;
                if (window.createObjectURL != undefined) { // basic
                    url = window.createObjectURL(file);
                } else if (window.URL != undefined) { // mozilla(firefox)
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) { // webkit or chrome
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            },
            uploadImg(options) {
                $("#" + options.element).on('change', "#" + options.element + "File", function (e) {
                    var uf = e.currentTarget.files[0];
                    var imgSize = uf.size;
                    if (options.uploaded + 1 > options.maxNum) {
                        this.value = null;
                        return alert("最多只能上传" + options.maxNum + "张");
                    }
                    if (imgSize > options.maxSize) { //1M
                        return alert("上传图片不能超过" + options.maxSize);
                    };
                    if (uf.type != 'image/png' && uf.type != 'image/jpeg' && uf.type != 'image/gif') {
                        return alert("图片上传格式不正确");
                    }
                    var formFile = new FormData();
                    formFile.append("file", uf);
                    $.ajax({
                        url: options.uploadUrl,
                        type: 'POST',
                        data: formFile,
                        async: true,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (res) {
                            if (res.code == 0) {
                                options.uploaded += 1;
                                $("#" + options.element).trigger("imgUploaded", [res]);
                            } else {
                                alert("上传异常");
                            }
                        }
                    });
                    var fileList = e.currentTarget.files;
                    for (var i = 0; i < fileList.length; i++) {
                        var imgSrcI = $.imageUpload.getObjectURL(fileList[i]);
                        // imgName.push(fileList[i].name);
                        options.imgSrc.push(imgSrcI);
                        // imgFile.push(fileList[i]);
                    }
                    $.imageUpload.addNewContent(options);
                    this.value = null; //上传相同图片
                });

            },
            addNewContent: function (options) {
                var viewEl = $("#" + options.element).find(".content-img-list");
                $(viewEl).html("");
                for (var a = 0; a < options.imgSrc.length; a++) {
                    var oldBox = $(viewEl).html();
                    $(viewEl).html(oldBox + '<li class="content-img-list-item"><img src="' +options.imgSrc[a] + '" alt="">' +
                        '<div class="hide"><a index="' + a + '" class="delete-btn"><i class="gcl fa fa-remove"></i></a>' +
                        '<a index="' + a + '" class="big-btn" type="button" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="gcl fa fa-search-plus"></i></a></div></li>');
                }
            }
            ,
            removeImg: function () {


            },
            initEve: function (options) {
                // 鼠标经过显示删除按钮
                $("#" + options.element).on('mouseover', '.content-img-list-item', function () {
                    $(this).children('div').removeClass('hide');
                });
                // 鼠标离开隐藏删除按钮
                $("#" + options.element).on('mouseleave', '.content-img-list-item', function () {
                    $(this).children('div').addClass('hide');
                });
                // 单个图片删除
                $("#" + options.element).on("click", '.content-img-list-item a .fa-remove', function () {
                    options.uploaded -= 1;
                    var index = $(this).parent().parent().parent().index();
                    $("#" + options.element).trigger("imgRemove", [options.imgSrc[index]]);
                    options.imgSrc.splice(index, 1);
                    $.imageUpload.addNewContent(options);
                });
                if (options.imgSrc.length > 0) {
                    options.uploaded = options.imgSrc.length;
                    $.imageUpload.addNewContent(options);
                }
                //  图片查看
                $("#" + options.element).on("click", '.content-img-list-item a .fa-search-plus', function () {
                    var index = $(this).parent().parent().parent().index();
                    $("body .modal-content").html("");
                    $("body .modal-content").html('<div  class="show"><img src="' + options.imgSrc[index] + '" alt=""><div>');
                });

            },
            initDom: function (options) {
                var domHtml = '<div class="content-img" ><ul class="content-img-list"></ul>' +
                    '<div class="file">' +
                    '<i class="gcl fa fa-plus"></i>' +
                    '<input type="file" id="' + options.element + 'File" accept="' + options.accept + '">'
                '</div></div>';
                $("#" + options.element).html(domHtml);
                var viewDom = '<div class="main" id="img-view-box">' +
                    '<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">' +
                    '<div class="modal-dialog modal-lg" role="document">' +
                    '<div class="modal-content">' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

                    if($('#img-view-box').length==0){
                        $('body').append(viewDom); 
                    }
                
            },
            initEvent: function (options) {
                $.imageUpload.initDom(options);
                $.imageUpload.initEve(options);
                $.imageUpload.uploadImg(options);
            }
        }
    })
})(jQuery);

