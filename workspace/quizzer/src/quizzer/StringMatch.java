package quizzer;

public class StringMatch {

	public static void main (String[] args) throws java.lang.Exception
	{
		// your code goes here
		String str[] = new String[5];
		str[0]="abc";
		str[1]="bcd";
		str[2]="ef";
		str[3]="xyz";
		str[4]="yd";
		int low=0,high=4,flag=0,mid=0;
		String target="xyz";
		while(low<=high)
		{
			mid=(low+high)/2;
			if(str[mid].compareTo(target)==0)
			{
				flag=1;
				break;
			}
			else if(str[mid].compareTo(target)>0)
				high=mid+1;
			else
				low=mid-1;
		}
		if(flag==0)
			System.out.println("Not found");
		else
			System.out.println("found at "+mid);
	}

}
