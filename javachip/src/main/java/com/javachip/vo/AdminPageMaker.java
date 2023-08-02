package com.javachip.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminPageMaker 
{
		//���� ����¡
		//�ϴܿ� ������ �׺���̼��� ����Ҷ� �ʿ��� ������ ��Ƴ�����
		private int displayPageNum = 10;    // ������ ��Ͽ� ������ ������ ��ȣ ����	
		private int startPage;			// ������ ��Ͽ� ���۹�ȣ	
		private int endPage;            //������ ��Ͽ� ����ȣ
		
		private int totalCount;          //��ü �� ����
		
		private boolean prev;     //������ư �� (true/false)
		private boolean next;	//������ư ��
		
		private AdminSearchVO AdminSearchVO;   //���������� ����ִ� ��ü
		
		public int getDisplayPageNum() {
			return displayPageNum;
		}

		public void setDisplayPageNum(int diplayPageNum) {
			this.displayPageNum = diplayPageNum;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcData();   
		}

		//��ü �۰����� ������ͼ�  ���������� ��ȣ�� �������� ��ȣ �� ���� ������ư ������ �ʿ��� �޼ҵ�
		private void calcData() {
			//ó�� 10������ ����	
			endPage = (int)(Math.ceil(AdminSearchVO.getPage()/(double)displayPageNum) * displayPageNum);
			//ó��1������ ���� 
			startPage = (endPage-displayPageNum)+1;   
			
			//���� ������ ���� ��������  endPage�� �̴´�
			int tempEndPage = (int)(Math.ceil(totalCount/(double)AdminSearchVO.getPerPageNum()));
			
			//10���� ������ endPage�� ���� ������ ��ȣ���� ũ�ٸ� ������ȣ�������� ���������� ���� 
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}
			
			// ������������ 1���̸� ���� ��ȣ�� �ʿ�����ϱ� ������ư �Ⱥ����ش� �׷��� false�� 
			prev = (startPage ==1 ? false : true);
			// ���������� �Ѱ����� ��ü �������� ������ ������ư�� �Ⱥ����ְ�  ��ü������ �� ũ��  ������ư �����ش� 
			next = (endPage*AdminSearchVO.getPerPageNum() >= totalCount ? false :true);
			
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public AdminSearchVO getAdminSearchVO() {
			return AdminSearchVO;
		}

		public void setAdminSearchVO(AdminSearchVO adminSearchVO) {
			AdminSearchVO = adminSearchVO;
		}

		

		
}
