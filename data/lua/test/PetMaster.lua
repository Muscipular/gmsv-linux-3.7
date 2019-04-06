function PetMaster_Init( _MePtr )

	Char.SetData(_MePtr, %����_����%, 110599);    --%����_����%
	Char.SetData(_MePtr, %����_ԭ��%, 110599);    --%����_ԭ��%
	Char.SetData(_MePtr, %����_��ͼ����%, 0);     --%����_��ͼ����%
	Char.SetData(_MePtr, %����_��ͼ%, 25000);      --%����_��ͼ%
	Char.SetData(_MePtr, %����_X%, 25);          --%����_X%
	Char.SetData(_MePtr, %����_Y%, 13);           --%����_Y%
	Char.SetData(_MePtr, %����_����%, %����%);    --%����_����%, %����%
	Char.SetData(_MePtr, %����_ԭ��%, "�����ʦţ����");    --%����_ԭ��%
	if (Char.SetTalkedEvent(nil, "PetMaster_Talked", _MePtr) < 0) then
		print("PetMaster_Talked ע���¼�ʧ�ܡ�");
		return false;
	end
	if (Char.SetWindowTalkedEvent(nil, "PetMaster_WindowTalked", _MePtr) < 0) then
		print("PetMaster_WindowTalked ע���¼�ʧ�ܡ�");
		return false;
	end
	return true;
end
function PetMaster_Talked( _MePtr,_TalkPtr)
	if NLG.CheckInFront(_TalkPtr,_MePtr,1)==false then
		return;
	end
	NLG.ShowWindowTalked(_TalkPtr,0,12,0,
	"\n�������!["..Char.GetData(_TalkPtr,%����_ԭ��%).."],���ǳ����ʦţ���ģ��κγ���ĳɳ������Ѳ����ҵ��۾�����ֻ��Ҫ֧����100����Ҿ��ܸ��������ĵ���!"..
	"\n\n������������",
	_MePtr);
 return;
end
function PetMaster_WindowTalked(_MePtr,_TalkPtr,_Seqno,_Select,_Data)

	if (_Select==8) then 
		NLG.TalkToCli(_TalkPtr,"���ˣ��ҵ��ۺ��ۣ�o(>�n<)o��������...",4,0,_MePtr);
		return;
	end
	local tab={};
	local tabnopet={};
	if (_Seqno==0) then
		local buf="";
		for t = 1,5 do
			
			PetIndex =Char.GetPetIndex(_TalkPtr,t-1);
			if (PetIndex>0) then 
				buf=Char.GetData( PetIndex, %����_ԭ��%);
			else 
				buf="�޳���";
				
				
			end
			tab[t]=buf;
			
		end	
		NLG.ShowWindowTalked(_TalkPtr,2,2,1,
		"2\n��ѡ��"..
		"\n\n       ��["..tab[1].."]��"..
		"\n       ��["..tab[2].."]��"..
		"\n       ��["..tab[3].."]��"..
		"\n       ��["..tab[4].."]��"..
		"\n       ��["..tab[5].."]��",
		_MePtr);
		
		
		
	end
	if (_Seqno==1) then
		local PetIndex1=Char.GetPetIndex(_TalkPtr,tonumber(_Data)-1)
		if (PetIndex1>0) then
			local nowmoney=Char.GetData(_TalkPtr,%����_���%)-100;
			if (nowmoney<0) then 
				NLG.TalkToCli(_TalkPtr,"��Ǹ���Ǯ����...",4,0,_MePtr);
				
			else	
				Char.SetData(_TalkPtr,%����_���%,nowmoney);
				NLG.TalkToCli(_TalkPtr,"����100",4,0);
				NLG.ShowWindowTalked(_TalkPtr,0,1,12,
				"��["..Char.GetData( Char.GetPetIndex(_TalkPtr,tonumber(_Data)-1), %����_ԭ��%).."]����������£�"..
				"\n����["..Pet.GetArtRank(PetIndex1,0)-Pet.FullArtRank(PetIndex1,0).."]��"..
				"\n����["..Pet.GetArtRank(PetIndex1,1)-Pet.FullArtRank(PetIndex1,1).."]��"..
				"\nǿ��["..Pet.GetArtRank(PetIndex1,2)-Pet.FullArtRank(PetIndex1,2).."]��"..
				"\n�ٶ�["..Pet.GetArtRank(PetIndex1,3)-Pet.FullArtRank(PetIndex1,3).."]��"..
				"\nħ��["..Pet.GetArtRank(PetIndex1,4)-Pet.FullArtRank(PetIndex1,4).."]��",
				_MePtr);
			end
		else 
			NLG.ShowWindowTalked(_TalkPtr,0,1,11,"��磬�Ǹ�λ��û����...���ѩn��b��",_MePtr);
		end
	end
	return;
end
