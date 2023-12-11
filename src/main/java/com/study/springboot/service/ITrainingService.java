package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.TrainingDto;

public interface ITrainingService {
	public List<TrainingDto> Chart(int mId); // 모든 게시물 가져오기
	public int Training(int mId, int tPushNum, int tSitupNum, int tPullupNum, int tRunDist, int tDate);
	public List<TrainingDto> selData(int mId, int year, int month);
}
