package com.p2p.controller;

import com.p2p.bean.BorrowApply;
import com.p2p.bean.BorrowDetail;
import com.p2p.bean.User;
import com.p2p.common.BeanCopyUtils;
import com.p2p.common.Pager;
import com.p2p.common.ServerResponse;
import com.p2p.query.BorrowQuery;
import com.p2p.service.BorrowApplyService;
import com.p2p.vo.BorrowApplyDetail;
import com.p2p.vo.IndexBorrowVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 7025 on 2017/12/21.
 */
@RestController
@RequestMapping("/data/borrow")
public class BorrowApplyController {

    @Autowired
    private BorrowApplyService borrowApplyService;

    @RequestMapping(value="save", method = RequestMethod.POST)
    public ServerResponse save(BorrowApplyDetail borrowApplyDetail, HttpSession session) {
        BorrowApply borrowApply = new BorrowApply();
        BorrowDetail borrowDetail = new BorrowDetail();
        try {
            BeanCopyUtils.copy(borrowApply, borrowApplyDetail);
            BeanCopyUtils.copy(borrowDetail, borrowApplyDetail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Object object = session.getAttribute("user");
        if(object != null) {
            User user = (User)object;
            borrowApply.setUid(user.getUid());
            return borrowApplyService.saveBorrow(borrowApply, borrowDetail);
        }
        return ServerResponse.createByError("借款失败");
    }

    @RequestMapping("detail")
    public BorrowApplyDetail getDetail(Integer baid) {
        return (BorrowApplyDetail) borrowApplyService.getById(baid);
    }

    @RequestMapping("indexList")
    public Pager getBorrowByBzid(Integer page, Integer limit, IndexBorrowVO indexBorrowVO) {
        return borrowApplyService.listPagerByBzid(page, limit, indexBorrowVO);
    }
    /**
     * 个人用户查看借款列表
     * @return
     */
    @RequestMapping("list")
    public Pager borrowList(Integer page, Integer limit, Integer ckstatus, Integer term, Integer bzid,
                            Float nprofitMin, Float nprofitMax, String cpname, HttpSession session) {
        BorrowQuery borrowQuery = queryCriteria(ckstatus, term, bzid, nprofitMin, nprofitMax, cpname);
        Object obj = session.getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            borrowQuery.setUid(user.getUid());
            return borrowApplyService.listPagerCriteria(page, limit, borrowQuery);
        }
        return new Pager(page, limit);
    }

    /**
     * 管理员查看借款列表
     * @return
     */
    @RequestMapping("adminList")
    public Pager borrowAdminList(Integer page, Integer limit, Integer ckstatus, Integer term, Integer bzid,
                            Float nprofitMin, Float nprofitMax, String cpname) {
        BorrowQuery borrowQuery = queryCriteria(ckstatus, term, bzid, nprofitMin, nprofitMax, cpname);
        return borrowApplyService.listPagerCriteria(page, limit, borrowQuery);
    }

    /**
     * 前台投资列表
     * @return
     */
    @RequestMapping("frontList")
    public Pager borrowFrontList(Integer page, Integer limit, Integer ckstatus, Integer term, Integer bzid,
                            Float nprofitMin, Float nprofitMax, String cpname) {
        BorrowQuery borrowQuery = queryCriteria(ckstatus, term, bzid, nprofitMin, nprofitMax, cpname);
        borrowQuery.setCkstatus(6);
        return borrowApplyService.listPagerCriteria(page, limit, borrowQuery);
    }

    private BorrowQuery queryCriteria(Integer ckstatus, Integer term, Integer bzid,
                                      Float nprofitMin, Float nprofitMax, String cpname) {
        BorrowQuery borrowQuery = new BorrowQuery();
        if(ckstatus != null) {
            borrowQuery.setCkstatus(ckstatus);
        }
        if(nprofitMin != null) {
            borrowQuery.setNprofitMin(nprofitMin);
        }
        if(nprofitMax != null) {
            borrowQuery.setNprofitMax(nprofitMax);
        }
        if(bzid != null) {
            borrowQuery.setBzid(bzid);
        }
        if(term != null) {
            borrowQuery.setTerm(term);
        }
        if(cpname != null && !"".equals(cpname)) {
            borrowQuery.setCpname(cpname);
        }
        return borrowQuery;
    }
}
