package lin.project.firstproject2018.model;

import java.util.List;

import lin.project.firstproject2018.bean.Comment;

public class CommentModel {
    Comment comment;
    List<Comment> commentReply;

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public List<Comment> getCommentReply() {
        return commentReply;
    }

    public void setCommentReply(List<Comment> commentReply) {
        this.commentReply = commentReply;
    }

}
