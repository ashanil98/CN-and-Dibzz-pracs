//Hamming Code generation and correction

#include<stdio.h>
#include<conio.h>

void main()
{
int arr1[7], arr2[3],arr3[4],i,n,temp;
clrscr();
printf("\nChoose an operation :\n1]Send an expression \n2]Receive an expression\n");
scanf("%d",&n);
if(n==2)
	{
	printf("Enter the seven bit expression :");
	for(i=6;i>=0;i--)
	{
		scanf("%d",&arr1[i]);
	}


	arr2[0] = (arr1[0]+arr1[2]+arr1[4]+arr1[6])%2;
	arr2[1] = (arr1[1]+arr1[2]+arr1[5]+arr1[6])%2;
	arr2[2] = (arr1[3]+arr1[4]+arr1[5]+arr1[6])%2;

	printf("\nParity bits  : %d%d%d\n",arr2[2],arr2[1],arr2[0]);

	for(i=0;i<=2;i++)
	{
		if(arr2[i]!=0)
		{
			break;
		}
	}
	i--;
	if(i==2)
	{
		printf("\nNo error detected...\n");
	}

	else
	{
		printf("\nError Exists...\n");
		temp = ((arr2[0])+(arr2[1]*2)+(arr2[2])*4)-1;
		printf("Bit switch at : %d\n",temp);
		if(a[temp]==1)
			{
				arr1[temp]=0;
			}
		else
			{
				arr1[temp]=1;
			}
	}
	printf("\nThe checked string is : ");
	for(i=6;i>=0;i--)
	{
		printf("%d",arr1[i]);
	}

    }
else
	{
	printf("Enter the four bit expression :");
	for(i=3;i>=0;i--)
	{
		scanf("%d",&arr3[i]);
	}

	arr1[2] = arr3[0];
	arr1[4] = arr3[1];
	arr1[5] = arr3[2];
	arr1[6] = arr3[3];

	arr1[0] = (arr1[2]+arr1[4]+arr1[6])%2;
	arr1[1] = (arr1[2]+arr1[5]+arr1[6])%2;
	arr1[3] = (arr1[4]+arr1[5]+arr1[6])%2;
	printf("\nThe transmission string is : ");
	for(i=6;i>=0;i--)
	{
		printf("%d",arr1[i]);
	}

	}
       getch();
}