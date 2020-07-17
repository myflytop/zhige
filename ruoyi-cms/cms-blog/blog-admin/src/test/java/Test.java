import org.springframework.util.ResourceUtils;

import java.io.FileNotFoundException;
import java.net.URI;
import java.net.URISyntaxException;


public class Test {
    public static void main(String[] args) throws FileNotFoundException, URISyntaxException {
        URI themeUri = ResourceUtils.getURL("/abc").toURI();
        System.out.println(themeUri.getScheme());

    }

}
