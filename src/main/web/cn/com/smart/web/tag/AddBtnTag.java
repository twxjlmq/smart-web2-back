package cn.com.smart.web.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import cn.com.smart.utils.StringUtil;
import cn.com.smart.web.bean.UserInfo;
import cn.com.smart.web.constant.enumdef.BtnPropType;
import cn.com.smart.web.service.OPAuthService;
import cn.com.smart.web.tag.bean.EditBtn;

/**
 * 添加按钮标签
 * @author lmq
 *
 */
public class AddBtnTag extends BtnTag {
	
	private static final long serialVersionUID = 3300996504651197696L;
	
	private EditBtn addBtn;
	
	protected String selectedType = BtnPropType.SelectType.NONE.getValue();
	
	private String title;
    private String width="600";

	@Override
   	public int doEndTag() throws JspException {
   		return EVAL_PAGE;
   	}

   	@Override
   	public int doStartTag() throws JspException {
   		try {
   			id="add";
   			name = StringUtil.isEmpty(name)?"添加":name;
   			if(StringUtil.isEmpty(selectedType)) 
   				selectedType = BtnPropType.SelectType.NONE.getValue();
   			JspWriter out = this.pageContext.getOut();
   			if(null == addBtn)
   				addBtn = new EditBtn(id, uri, busi, title, width,btnStyle,name);
   			else {
   				if(StringUtil.isEmpty(addBtn.getBtnStyle()))
   					addBtn.setBtnStyle(btnStyle);
   				if(StringUtil.isEmpty(addBtn.getName()))
   					addBtn.setName(name);
   				if(StringUtil.isEmpty(addBtn.getWidth()))
   					addBtn.setWidth("600");
   				if(StringUtil.isEmpty(addBtn.getSelectedType()))
   					addBtn.setSelectedType(selectedType);
   			}
   			
   			UserInfo userInfo = getUserInfo();
   			OPAuthService opAuthServ = (OPAuthService)getService("opAuthServ");
   			if(opAuthServ.isAuth(currentUri, addBtn, userInfo.getRoleIds())) {
   			   out.println("<button type='button' class='btn "+addBtn.getBtnStyle()+" add param' data-selected-type='"+StringUtil.handNull(addBtn.getSelectedType())+"' data-uri='"+StringUtil.handNull(addBtn.getUri())+"' data-title='"+StringUtil.handNull(addBtn.getTitle())+"' data-busi='"+StringUtil.handNull(addBtn.getBusi())+"' data-value='' dialog-width='"+addBtn.getWidth()+"' ><i class='glyphicon glyphicon-plus'></i> "+addBtn.getName()+"</button>");
   			}
   			userInfo = null;
   		} catch (Exception e) {
   			throw new JspException(e.getMessage());
   		}
   		return SKIP_BODY;
   	}

   	@Override
   	public void release() {
   		super.release();
   		addBtn = null;
   	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getBusi() {
		return busi;
	}

	public void setBusi(String busi) {
		this.busi = busi;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public EditBtn getAddBtn() {
		return addBtn;
	}

	public void setAddBtn(EditBtn addBtn) {
		this.addBtn = addBtn;
	}
	 
    public String getBtnStyle() {
		return btnStyle;
	}

	public void setBtnStyle(String btnStyle) {
		this.btnStyle = btnStyle;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
