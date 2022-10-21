package org.zenga.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TryRestVO {
	
	private Integer mno; //번호
	private String firstName;
 	private String lastName;
}
