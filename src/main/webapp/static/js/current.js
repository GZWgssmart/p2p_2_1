/**
 * 通用js，js的工具类
 */

/**
 * 上传图片的通用js
 * @param upload 必填
 * @param elemId 按钮id
 * @param url 上传路径
 * @param imgEx 缩略图片id
 * @param realImg 返回真实图片路径
 * @param errorText 错误信息显示位置
 */
function uploadImg(upload, elemId, url, imgEx, realImg, errorText) {
    var uploadImg = upload.render({
        elem: '#'+elemId
        , url: url
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#'+imgEx).attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res > 0) {
                return utils.alert('失败！');
            } else {
                return $('#'+realImg).val(res.msg);
            }
            //上传成功
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#'+errorText);
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadImg.upload();
            });
        }
    });
}
