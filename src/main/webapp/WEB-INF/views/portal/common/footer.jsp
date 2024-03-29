<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!-- #include('./partial/footer.html') -->
<footer id="footer" class="footer bg-white">	
	<div class="footer-social">
	        <div class="footer-container clearfix">
	            <div class="social-list">
	                <a class="social weibo" target="_blank" href="javascript:alert('未添加微博哦')">微博</a>
	                <a class="social zhihu" target="_blank"
	                   href="javascript:alert('未添加知乎哦')">知乎</a>
	                <a class="social rss" target="_blank" href="javascript:alert('未添加RSS哦')">RSS</a>
	                <a class="social github" target="_blank"
	                   href="https://github.com/Pu-ME">Github</a>
	                <a class="social twitter" target="_blank" href="javascript:alert('未添加Twitter哦')">Twitter</a>
	            </div>
	        </div>
	    </div>
	    <div class="footer-meta">
	        <div class="footer-container">
	            <div class="meta-item meta-copyright">
	                <div class="meta-copyright-info">
	                    <a href="#" class="info-logo">
	                        <img src="${pageContext.request.contextPath}/static/portal/img/logo.png" alt="wonder">
	                    </a>
	                    <div class="info-text">
	                        <h2>${siteInfo.title }</h2>
	                        <p>Powered by <a href="https://github.com/pinghsu_h5" target="_blank" rel="nofollow">${siteInfo.title }</a>
	                        </p>
	                        <p>&copy; 2019 <a href="https://github.com/Pu-ME" target="_blank">Pu_ME</a></p>
	                    </div>
	                </div>
	            </div>
	
	            <div class="meta-item meta-posts">
	                <h3 class="meta-title">最新文章</h3>
	                <c:forEach items="${latestArticle }" var="data" >
		                <li>
		                    <a href="${pageContext.request.contextPath}/article/${data.id}" target="_blank">${data.title }</a>
		                </li>
	                </c:forEach>
	            </div>
	
	            <div class="meta-item meta-comments">
	                <h3 class="meta-title">最新评论</h3>
	                <li>
	                    <a href="javascript:;">评论暂未开放</a>
                </li>
            </div>
        </div>
    </div>
</footer>

<!-- #if(is_post) -->
<div id="directory-content" class="directory-content">
    <div id="directory">
        这里应该算是所有文章目录
    </div>
</div>
<script>
    $('#directory').html('');
    //生成文章目录
    var postDirectoryBuild = function() {
        var postChildren = function children(childNodes, reg) {
                var result = [],
                    isReg = typeof reg === 'object',
                    isStr = typeof reg === 'string',
                    node, i, len;
                for (i = 0, len = childNodes.length; i < len; i++) {
                    node = childNodes[i];
                    if ((node.nodeType === 1 || node.nodeType === 9) &&
                        (!reg ||
                        isReg && reg.test(node.tagName.toLowerCase()) ||
                        isStr && node.tagName.toLowerCase() === reg)) {
                        result.push(node);
                    }
                }
                return result;
            },
            createPostDirectory = function(article, directory, isDirNum) {
                var contentArr = [],
                    titleId = [],
                    levelArr, root, level,
                    currentList, list, li, link, i, len;
                levelArr = (function(article, contentArr, titleId) {
                    var titleElem = postChildren(article.childNodes, /^h\d$/),
                        levelArr = [],
                        lastNum = 1,
                        lastRevNum = 1,
                        count = 0,
                        guid = 1,
                        id = 'directory' + (Math.random() + '').replace(/\D/, ''),
                        lastRevNum, num, elem;
                    while (titleElem.length) {
                        elem = titleElem.shift();
                        contentArr.push(elem.innerHTML);
                        num = +elem.tagName.match(/\d/)[0];
                        if (num > lastNum) {
                            levelArr.push(1);
                            lastRevNum += 1;
                        } else if (num === lastRevNum ||
                            num > lastRevNum && num <= lastNum) {
                            levelArr.push(0);
                            lastRevNum = lastRevNum;
                        } else if (num < lastRevNum) {
                            levelArr.push(num - lastRevNum);
                            lastRevNum = num;
                        }
                        count += levelArr[levelArr.length - 1];
                        lastNum = num;
                        elem.id = elem.id || (id + guid++);
                        titleId.push(elem.id);
                    }
                    if (count !== 0 && levelArr[0] === 1) levelArr[0] = 0;

                    return levelArr;
                })(article, contentArr, titleId);
                currentList = root = document.createElement('ul');
                dirNum = [0];
                for (i = 0, len = levelArr.length; i < len; i++) {
                    level = levelArr[i];
                    if (level === 1) {
                        list = document.createElement('ul');
                        if (!currentList.lastElementChild) {
                            currentList.appendChild(document.createElement('li'));
                        }
                        currentList.lastElementChild.appendChild(list);
                        currentList = list;
                        dirNum.push(0);
                    } else if (level < 0) {
                        level *= 2;
                        while (level++) {
                            if (level % 2) dirNum.pop();
                            currentList = currentList.parentNode;
                        }
                    }
                    dirNum[dirNum.length - 1]++;
                    li = document.createElement('li');
                    link = document.createElement('a');
                    link.href = '#' + titleId[i];
                    link.innerHTML = !isDirNum ? contentArr[i] :
                        dirNum.join('.') + ' ' + contentArr[i] ;
                    li.appendChild(link);
                    currentList.appendChild(li);
                }
                directory.appendChild(root);
            };
        createPostDirectory(document.getElementById('post-content'),document.getElementById('directory'), true);
    };
    postDirectoryBuild();
</script>
<!-- #end -->
<script src="${pageContext.request.contextPath}/static/portal/js/headroom.min.js"></script>
<script src="//cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/static/portal/js/instantclick.min.js"></script>
<script type="text/javascript">
    // #if(is_post)
    //     var postDirectory = new Headroom(document.getElementById("directory-content"), {
    //         tolerance: 0,
    //         offset : 100,
    //         classes: {
    //             initial: "initial",
    //             pinned: "pinned",
    //             unpinned: "unpinned"
    //         }
    //     });
    // #end
    var header = new Headroom(document.getElementById("header"), {
        tolerance: 10,
        offset : 80,
        classes: {
            initial: "animated",
            pinned: "slideDown",
            unpinned: "slideUp"
        }
    });
    header.init();
    $('#search-inp').keypress(function (e) {
        var key = e.which; //e.which是按键的值
        if (key == 13) {
            var q = $(this).val();
            if (q && q != '') {
                window.location.href = '/search/' + q;
            }
        }
    });
</script>
<script data-no-instant>
    InstantClick.on('change', function (isInitialLoad) {
        var blocks = document.querySelectorAll('pre code');
        for (var i = 0; i < blocks.length; i++) {
            hljs.highlightBlock(blocks[i]);
        }
        if (isInitialLoad === false) {
            if (typeof ga !== 'undefined') ga('send', 'pageview', location.pathname + location.search);
        }
    });
    InstantClick.init('mousedown');
</script>
</body>
</html>