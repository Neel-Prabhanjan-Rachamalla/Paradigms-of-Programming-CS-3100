import java.util.Arrays;

public class Display
{
    public static void main(String args[])
    {
        int k=args.length;
        int n=6,m=6;
        char c='#';
        String s=new String("");
        int i,j,t;

        for(i=0 ; i<k ; i++)
        {
            if(args[i].equals("-m")) m=Integer.parseInt(args[i+1]);
            else if(args[i].equals("-n")) n=Integer.parseInt(args[i+1]);
            else if(args[i].equals("-c")) c=args[i+1].charAt(0);
            else if(i==k-1) s=args[i];
        }

        t=s.length();

        char matrix[][]=new char[n][m*t+t-1];
        for(i=0 ; i<n ; i++)
        {
            for(j=0 ; j<m*t+t-1 ; j++)
            {
                matrix[i][j]=' ';
            }
        }

        for(k=0,j=0 ; k<t ; k++,j+=m+1)
        { 
            switch(s.charAt(k))
            {
                case 'a' :
                {
                    for(int x=0 ; x<n ; x++)
                    {
                        matrix[x][j+0]=c;
                        matrix[x][j+m-1]=c;
                    }

                    for(int y=0 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[(n-1)/2][j+y]=c;
                    }

                    break;
                }

                case 'e' :
                {
                    for(int x=0 ; x<n ; x++)
                    {
                        matrix[x][j+0]=c;
                    }

                    for(int y=0 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[(n-1)/2][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'i' :
                {
                    for(int x=0 ; x<n ; x++)
                    {
                        matrix[x][j+(m-1)/2]=c;
                    }

                    for(int y=0 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'o' :
                {
                    for(int x=1 ; x<n-1 ; x++)
                    {
                        matrix[x][j+0]=c;
                        matrix[x][j+m-1]=c;
                    }

                    for(int y=1 ; y<m-1 ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'u' :
                {
                    for(int x=0 ; x<n-1 ; x++)
                    {
                        matrix[x][j+0]=c;
                        matrix[x][j+m-1]=c;
                    }

                    for(int y=1 ; y<m-1 ; y++)
                    {
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'b' :
                {
                    for(int x=1 ; x<n-1 ; x++)
                    {
                        matrix[x][j+0]=c;
                        matrix[x][j+m-1]=c;
                    }

                    matrix[0][j+0]=c;
                    matrix[n-1][j+0]=c;
                    matrix[(n-1)/2][j+m-1]=' ';

                    for(int y=0 ; y<m-1 ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[(n-1)/2][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'c' :
                {
                    for(int x=1 ; x<n-1 ; x++)
                    {
                        matrix[x][j+0]=c;
                    }

                    for(int y=1 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    break;
                }

                case 'd' :
                {
                    for(int x=0 ; x<n ; x++)
                    {
                        matrix[x][j+0]=c;
                        matrix[x][j+m-1]=c;
                    }

                    for(int y=0 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[n-1][j+y]=c;
                    }

                    matrix[0][j+m-1]=' ';
                    matrix[n-1][j+m-1]=' ';

                    break;
                }

                case 'f' :
                {
                    for(int x=0 ; x<n ; x++)
                    {
                        matrix[x][j+0]=c;
                    }

                    for(int y=0 ; y<m ; y++)
                    {
                        matrix[0][j+y]=c;
                        matrix[(n-1)/2][j+y]=c;
                    }

                    break;
                }
            }
        }

        for(i=0 ; i<n ; i++)
        {
            for(j=0 ; j<m*t+t-1 ; j++)
            {
                System.out.print(matrix[i][j]);
            }
            System.out.println();
        }
    }
}