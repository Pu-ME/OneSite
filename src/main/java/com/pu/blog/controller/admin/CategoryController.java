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
import com.pu.blog.model.entity.Category;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.service.ArticleService;
import com.pu.blog.service.CategoryService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ArticleService articleService;

	/**
	 * 批量删除分类
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/{ids}", method = RequestMethod.DELETE)
	public Msg deleteCategory(@PathVariable("ids") String ids) {
		String[] list = ids.split("-");
		int count = articleService.countByCategoryIds(list);
		if (count > 0) {
			return Msg.fail().add("msg", "分类下存在文章");
		} else {
			categoryService.deleteBatch(list);
			return Msg.success().add("msg", "删除成功");
		}
	}

	/**
	 * 修改分类
	 * 
	 * @param category
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editcategory", method = RequestMethod.PUT)
	public Msg editCategory(Category category) {
		categoryService.editCategory(category);
		return Msg.success();
	}

	/**
	 * 获取分类
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Msg getCategory(@PathVariable("id") Integer id) {
		Category category = categoryService.getCategory(id);
		return Msg.success().add("category", category);
	}

	/**
	 * 添加分类
	 * 
	 * @param category
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editcategory", method = RequestMethod.POST)
	public Msg addCategory(Category category) {
		categoryService.addCategory(category);
		return Msg.success();
	}

	/**
	 * 分页查询分类
	 * 
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public Msg getCategories(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		int pageSize = 8;
		PageHelper.startPage(pn, pageSize);
		List<Category> categories = categoryService.getCategories();
		PageInfo<Category> page = new PageInfo<>(categories, 5);
		return Msg.success().add("page", page);
	}

	/**
	 * 跳转分类管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String goCategoryPage() {
		return "admin/category/list";
	}
}
