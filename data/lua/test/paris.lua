function SuperNPCTest_Init( _MePtr )

	Char.SetData(_MePtr, %����_����%, 108125);    --%����_����%
	Char.SetData(_MePtr, %����_ԭ��%, 108125);    --%����_ԭ��%
	Char.SetData(_MePtr, %����_��ͼ����%, 0);     --%����_��ͼ����%
	Char.SetData(_MePtr, %����_��ͼ%, 25000);      --%����_��ͼ%
	Char.SetData(_MePtr, %����_X%, 31);          --%����_X%
	Char.SetData(_MePtr, %����_Y%, 3);           --%����_Y%
	Char.SetData(_MePtr, %����_����%, %����%);    --%����_����%, %����%
	Char.SetData(_MePtr, %����_ԭ��%, "�����Ե�Сţ");    --%����_ԭ��%

	
	if (Char.SetTalkedEvent(nil, "SuperNPCTest_Talked", _MePtr) < 0) then
		print("SuperNPCTest_Talked ע���¼�ʧ�ܡ�");
		return false;
	end
	
	
	return true;
end



function SuperNPCTest_Talked( _MePtr, _TalkPtr)

	if(NLG.CheckInFront(_TalkPtr, _MePtr, 1) == false) then
		return ;
	end 
	paris1 = Char.GetData(_TalkPtr, %����_ԭ��%);
	paris2 = Char.GetData(_TalkPtr, %����_�ȼ�%);
	paris3 = Char.GetData(_TalkPtr, %����_������%);
	paris4 = Char.GetData(_TalkPtr, %����_��½����%);
	paris5 = Char.GetData(_TalkPtr, %����_����%);
	paris6 = Char.GetData(_TalkPtr, %����_�߶�����%);
	
	paris7 = Char.GetData(_TalkPtr, %����_ɱ����%);
	paris8 = Char.GetData(_TalkPtr, %����_���%);
	

	NLG.ShowWindowTalked(_TalkPtr, %�Ӵ�_ѶϢ��%, 0, 0, "\n���ã�" ..paris1.. "�����ĸ�����Ϣ���£�\n\n�ȼ���" ..paris2.. "\n������" ..paris5.. "\n��½������" ..paris4.. "\n����������" ..paris3.. "\n�ƶ�������" ..paris6.. "\nɱ������" ..paris7.. "\n����ħ�ң�" ..paris8.. " ",  _MePtr);

	return ;
end



