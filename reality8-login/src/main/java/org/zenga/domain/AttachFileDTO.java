package org.zenga.domain;

import lombok.Data;

//첨부파일 정보
@Data
public class AttachFileDTO {
	private String fileName;
	private String uploadPath; //업로드 경로
	private String uuid;
	private boolean image; //이미지 여부
}
