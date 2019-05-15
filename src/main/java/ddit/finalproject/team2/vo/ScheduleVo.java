package ddit.finalproject.team2.vo;

import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="schedule_no")
@ToString(exclude="schedule_content")
public class ScheduleVo implements Serializable{
	@NotNull private String schedule_no;
	@NotNull private String schedule_type;
	@NotNull private String schedule_title;
	@NotNull private String schedule_content;
	@NotNull private Date schedule_start;
	@NotNull private Date schedule_end;
	@NotNull private Date schedule_add;
	private String lecture_code;
}
