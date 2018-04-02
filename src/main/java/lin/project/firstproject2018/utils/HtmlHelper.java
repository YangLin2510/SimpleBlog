package lin.project.firstproject2018.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.mysql.jdbc.StringUtils;

public class HtmlHelper {
    /**
     * 获取一个html文档的前面几个文本文字
     *
     * @param htmlContent
     * @param length
     * @return
     */
    public static String getDescFromHtml(String htmlContent, int length) {
        if (StringUtils.isNullOrEmpty(htmlContent) || length <= 0) {
            throw new IllegalArgumentException("htmlContent and length illegal");
        }
        Document document = Jsoup.parse(htmlContent);
        String text = document.body().text();
        if (text.length() < length) {
            length = text.length();
        }
        return text.substring(0, length);
    }

}
