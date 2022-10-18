package com.baidu.entity;
import java.sql.Time;
import lombok.Data;

@Data
public class Sleep {
    private String id;
    private Time start;
    private Time end;
    private Integer totalTime;
    private String date;
}
