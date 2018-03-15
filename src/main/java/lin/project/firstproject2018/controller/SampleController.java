package lin.project.firstproject2018.controller;

import lin.project.firstproject2018.mapper.QiuShiBaiKeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
    @Autowired
    QiuShiBaiKeMapper qiuShiBaiKeMapper;
    @RequestMapping("/gretting")
    public ModelAndView greeting(ModelAndView modelAndView,Integer id){
        ModelAndView view = new ModelAndView("hello");
        view.addObject("msg",qiuShiBaiKeMapper.selectById(id==null?300:id));
        return view;
    }
}
