package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.tree.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 动态树范例
 */
public class DemoTree implements ITreeAware
{

    public void genTree(TreeNode root,Map<String, String> map, HttpServletRequest request)
    {
        TreeNode level1 = new TreeNode("1","层1");
        TreeNode level2 = new TreeNode("2","层2");
        TreeNode level3 = new TreeNode("3","层3");

        level1.setGenChildren(true);
        level2.setGenChildren(true);
        level3.setGenChildren(true);

        root.addChildren(level1);
        root.addChildren(level2);
        root.addChildren(level3);
    }

    public void genChildren(TreeNode parent, Map<String, String> map, HttpServletRequest request)
    {
        String parentId = parent.getId();
        for(int i = 0; i < 10; i++)
        {
            parent.addChildren(new TreeNode(parentId+i,"层"+parentId+i,""+parentId+i+".jsp"));
        }
        TreeNode child = new TreeNode(parentId+"99","层"+parentId+"99",""+parentId+99+".jsp");
        child.setGenChildren(true);
        parent.addChildren(child);
    }
}
