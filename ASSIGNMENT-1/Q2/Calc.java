import java.util.*;

public class Calc
{
    public static void main(String args[])
    {
        Vector<Integer> vec=new Vector<Integer>();

        int n=Code.code.length;
        int m=vec.size();

        for(int i=0 ; i<n ; i++)
        {
            if(Code.code[i].equals("push"))
            {
                vec.add(Integer.parseInt(Code.code[i+1]));
                m++;
            }
            else if(Code.code[i].equals("pop"))
            {
                if(m==0) continue;

                int a=vec.get(m-1);
                System.out.println(a);

                vec.remove(m-1);
                m--;
            }
            else if(Code.code[i].equals("dup"))
            {
                vec.add(vec.get(m-1));
                m++;
            }
            else if(Code.code[i].equals("add"))
            {
                if(m==0 || m==1) continue;
                
                int a=vec.get(m-1);
                int b=vec.get(m-2);

                vec.remove(m-1);
                m--;
                vec.remove(m-1);
                m--;

                vec.add(a+b);
                m++;
            }
            else if(Code.code[i].equals("sub"))
            {
                if(m==0 || m==1) continue;

                int a=vec.get(m-1);
                int b=vec.get(m-2);

                vec.remove(m-1);
                m--;
                vec.remove(m-1);
                m--;

                vec.add(a-b);
                m++;
            }
            else if(Code.code[i].equals("mul"))
            {
                if(m==0 || m==1) continue;

                int a=vec.get(m-1);
                int b=vec.get(m-2);

                vec.remove(m-1);
                m--;
                vec.remove(m-1);
                m--;

                vec.add(a*b);
                m++;
            }
            else if(Code.code[i].equals("div"))
            {
                if(m==0 || m==1) continue;

                int a=vec.get(m-1);
                int b=vec.get(m-2);

                vec.remove(m-1);
                m--;
                vec.remove(m-1);
                m--;

                vec.add(a/b);
                m++;
            }
        }
    }    
}
