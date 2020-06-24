public class Tg {
    public static void main(String[] args) {

        Object o1=123;
        Object o2=true;
        Object o3="false";
        Object o4=null;
        Object o5="";

        System.out.println(String.class.isInstance(o1));
        System.out.println(String.class.isInstance(o2));
        System.out.println(String.class.isInstance(o3));
        System.out.println(String.class.isInstance(o4));
        System.out.println(String.class.isInstance(o5));

        System.out.println(Number.class.isInstance(o2));
        System.out.println(Number.class.isInstance(o3));
        System.out.println(Number.class.isInstance(o4));
        System.out.println(Number.class.isInstance(o5));

        System.out.println(Boolean.class.isInstance(o1));
        System.out.println(Boolean.class.isInstance(o2));
        System.out.println(Boolean.class.isInstance(o3));
        System.out.println(Boolean.class.isInstance(o4));
        System.out.println(Boolean.class.isInstance(o5));





    }
}
