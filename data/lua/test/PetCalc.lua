----------------------------------------------------------------------
--���ƣ������㵵��
--˵����������ﵵ�����޸ĳ��ﵵ���ȵ�
--
--GMSV Lua QQȺ��14583019
--By Ducky�Ώͻ� (QQ:462363)
--In 2012.12.28
----------------------------------------------------------------------

function PetCalc_Init( _MeIndex )
	Char.SetData(_MeIndex, 1, 101020);
	Char.SetData(_MeIndex, 2, 101020);
	Char.SetData(_MeIndex, 3, 0);
	Char.SetData(_MeIndex, 4, 62014);
	Char.SetData(_MeIndex, 5, 11);
	Char.SetData(_MeIndex, 6, 3);
	Char.SetData(_MeIndex, 7, 6);
	Char.SetData(_MeIndex, 2000, "���㵵��ţ����");

	if (Char.SetTalkedEvent(nil, "PetCalc_Talked", _MeIndex) < 0) then
		print("PetCalc_Talked ע���¼�ʧ�ܡ�");
		return false;
	end

	if (Char.SetWindowTalkedEvent(nil, "PetCalc_WindowTalked", _MeIndex) < 0) then
		print("PetCalc_WindowTalked ע���¼�ʧ�ܡ�");
		return false;
	end

	return true;
end

function PetCalc_Talked( _MeIndex, _PlayerIndex)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 1) == false) then
		return ;
	end 

	local buf = PetCalc_ShowCalc(_PlayerIndex)
	NLG.ShowWindowTalked(_PlayerIndex, 0, 1, 0, buf, _MeIndex);
	return ;
end

function PetCalc_ShowCalc(_PlayerIndex)
		local buf =  "\n �������������������������㵵��\n\n";
		buf = buf .. "���������ơ���������������ǿ�ȡ����ݡ�ħ������"
		for i = 0, 4 do
			local PetIndex = Char.GetPetIndex(_PlayerIndex, i)
			if(PetIndex >=0) then
				--local buf1 = Char.GetData(PetIndex, %����_ԭ��%) .. "(" .. Char.GetPetEnemyId(_PlayerIndex, i) .. ")"
				local buf1 = Char.GetData(PetIndex, %����_ԭ��%)
				local buf2 = Pet.GetArtRank(PetIndex, %�赵_���%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_���%)
				local buf3 = Pet.GetArtRank(PetIndex, %�赵_����%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_����%)
				local buf4 = Pet.GetArtRank(PetIndex, %�赵_ǿ��%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_ǿ��%)
				local buf5 = Pet.GetArtRank(PetIndex, %�赵_�ٳ�%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_�ٳ�%)
				local buf6 = Pet.GetArtRank(PetIndex, %�赵_ħ��%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_ħ��%)
				local buf7 = Pet.GetArtRank(PetIndex, %�赵_���%) + Pet.GetArtRank(PetIndex, %�赵_����%) + Pet.GetArtRank(PetIndex, %�赵_ǿ��%) + Pet.GetArtRank(PetIndex, %�赵_�ٳ�%) + Pet.GetArtRank(PetIndex, %�赵_ħ��%) - Pet.FullArtRank(PetIndex, %�赵_���%) - Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.FullArtRank(PetIndex, %�赵_ǿ��%) - Pet.FullArtRank(PetIndex, %�赵_�ٳ�%) - Pet.FullArtRank(PetIndex, %�赵_ħ��%)
				buf = buf .. string.format("%12.12s",buf1) .. string.format("%6.6s",buf2) .. string.format("%6.6s",buf3) .. string.format("%6.6s",buf4) .. string.format("%6.6s",buf5) .. string.format("%6.6s",buf6) .. string.format("%4.3s",buf7)
			else
				buf = buf .. string.format("%12.12s","�޳���") .. "\n"
			end
		end
	return buf
end

function PetCalc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	return ;
end

