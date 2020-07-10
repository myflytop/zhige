import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        List<Long> lis=new ArrayList<>();
        lis.add(10L);
        lis.add(11L);
        for (int i = 0; i <lis.size() ; i++) {
            System.err.println(lis.get(i).getClass());
            add(lis.get(i));

        }

    }
    public static void add(Long a){
      System.out.println(a);
    }
}
