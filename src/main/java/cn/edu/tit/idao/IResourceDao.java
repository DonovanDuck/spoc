package cn.edu.tit.idao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import cn.edu.tit.bean.Resource;

@Component
public interface IResourceDao {
	/**
	 * 添加资源到资源库
	 * @param resourceList
	 */
	public void addResourceToLib(List<Resource> resourceList);
	
	/**
	 * 通过分类id从资源库查找同类资源
	 * @param categoryId
	 * @return
	 */
	public List<Resource> searchResourceByCourse(Integer courseId);
	
	/**
	 * 绑定资源和班级到资源班级关联表
	 * @param resourceId
	 * @param virtualClassNum
	 */
	public void bandResourceAndClass(@Param("resourceId")String resourceId, @Param("virtualClassNum")String virtualClassNum);
	
	/**
	 * 通过虚拟班级号查询对应的发布的资源id
	 * @param virtualClassNum
	 * @return
	 */
	public List<String> searchResourceIdByClass(String virtualClassNum);
	
	/**
	 * 通过资源id查询相关资源
	 * @param reosurceId
	 * @return
	 */
	public Resource searchResourceById(String resourceId);
	
}
