package com.javachip.vo;

//���� ����¡
public class AdminCriteria 
{
	
	private int page;    //��������ȣ�� ��� ����	
	
	private int perPageNum;  //�۸�ϰ���
	
	private int sNum;    // ���� ���� ��ȣ
	
	// �����ڰ� �����ɶ� ������� �ʱ�ȭ ���� �ִ´�
	public AdminCriteria() 
	{
		this.page = 1;
		this.perPageNum =15;
	}
	
	public int getsNum() 
	{
		return sNum;
	}

	public void setsNum(int sNum) 
	{
		this.sNum = sNum;
	}

		
	public int getPage() 
	{
		return page;
	}

	public void setPage(int page) 
	{
		this.page = page;
	}

	public int getPerPageNum() 
	{
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) 
	{
		this.perPageNum = perPageNum;
	}
}
