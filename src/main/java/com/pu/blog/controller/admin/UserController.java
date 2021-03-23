package com.pu.blog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pu.blog.model.entity.Msg;
import com.pu.blog.model.entity.User;
import com.pu.blog.service.UserService;
import com.pu.blog.utils.MD5Utils;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	@Autowired
	private UserService userService;

	/**
	 * 修改密码
	 * 
	 * @param oldPass
	 * @param newPass
	 * @param confirmPass
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editpass", method = RequestMethod.PUT)
	public Msg editPassword(@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "oldPass", required = true) String oldPass,
			@RequestParam(value = "newPass", required = true) String newPass,
			@RequestParam(value = "confirmPass", required = true) String confirmPass) {
		if (!newPass.equals(confirmPass)) {
			return Msg.fail().add("msg", "两次密码不一致");
		}
		User user = userService.getUserById(id);
		String oldValue = MD5Utils.getMD5Value(oldPass);
		if (!oldValue.equals(user.getPassword())) {
			return Msg.fail().add("msg", "密码错误");
		}
		User editUser = new User();
		editUser.setId(id);
		editUser.setPassword(MD5Utils.getMD5Value(newPass));
		userService.editPassword(editUser);
		return Msg.success().add("msg", "密码修改成功");
	}

	/**
	 * 修改信息
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.PUT)
	public Msg editUser(User user) {
		userService.editUser(user);
		return Msg.success();
	}

	/**
	 * 个人信息页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String goEditPage(@PathVariable("id") Integer id, Model model) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user/userinfo";
	}
}
