package com.pu.blog.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pu.blog.model.entity.Link;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.service.LinkService;

@Controller
@RequestMapping("/admin/link")
public class LinkController {
	@Autowired
	private LinkService linkService;

	/**
	 * 批量删除链接
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/{ids}", method = RequestMethod.DELETE)
	public Msg deleteCategory(@PathVariable("ids") String ids) {
		String[] list = ids.split("-");
		linkService.deleteBatch(list);
		return Msg.success().add("msg", "删除成功");
	}

	/**
	 * 通过id查询链接
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Msg getLink(@PathVariable("id") Integer id) {
		Link link = linkService.getLink(id);
		return Msg.success().add("link", link);
	}

	/**
	 * 编辑链接
	 * 
	 * @param link
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editlink", method = RequestMethod.PUT)
	public Msg editLink(Link link) {
		linkService.editLink(link);
		return Msg.success();
	}

	/**
	 * 添加链接
	 * 
	 * @param link
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editlink", method = RequestMethod.POST)
	public Msg addLink(Link link) {
		linkService.addLink(link);
		return Msg.success();
	}

	/**
	 * 分页查询连接
	 * 
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listlinks", method = RequestMethod.GET)
	public Msg listLinks(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		int pageSize = 8;
		PageHelper.startPage(pn, pageSize);
		List<Link> links = linkService.getLinks();
		PageInfo<Link> page = new PageInfo<>(links, 5);
		return Msg.success().add("page", page);
	}

	/**
	 * 跳转友链列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goListPage() {
		return "admin/link/list";
	}
}
