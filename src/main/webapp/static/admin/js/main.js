let $;
layui.use(['element', 'jquery', 'layer'], function () {
    let element = layui.element;
    let slde_type = 1; // 记录左侧导航菜单是打开，还是闭合{1:打开,0闭合}
    $ = layui.jquery;

    // 左侧导航 宽窄设定
    $('.admin-side-fold').on('click', function () {
        let side_width = $(".layui-side").width();
        if (side_width > 50) {
            slde_type = 0
            $(".layui-side").width(50);
            $(this).parent().find('span').hide();
            $(".layui-body").addClass('admin-main');
            $(".layui-footer").addClass('admin-main');
            $(".layui-nav-child").find('dd').addClass('admin-ddsided');
            $(".layui-nav-child").find('a').addClass('admin-pointer');
        } else {
            slde_type = 1
            $(".layui-side").width(200);
            $(this).parent().find('span').show();
            $(".layui-body").removeClass('admin-main');
            $(".layui-footer").removeClass('admin-main');
            $(".layui-nav-child").find('dd').removeClass('admin-ddsided');
            $(".layui-nav-child").find('a').removeClass('admin-pointer');
        }
    })
    // 左侧菜单栏tips提示
    $(".layui-nav-item").find('a').hover(function () {
        // 只有侧边栏为闭合状态才有菜单tips提示
        if (slde_type == 0) {
            let tips_title = $(this).attr('data-title');
            if (tips_title) {
            	 layer.tips("<span style='color:white'>"+tips_title+"</span>", $(this).find('i'), {time: 500,tips: [1, 'gray']});
            }
        }
    });
    element.render();
});