--[[

		EasyLuaFunc����ģ�� Ver 1.1         By Ducky�Ώͻ�

		�˽ű���������Ѱ�CG_GMSV_EXPANTION
���ã�
		����7���Դ��������򻯷��ӵ�Lua�ű�������
		MSG��Wait��Warp��ShopItemSplit��Split��EasySQL��WalkToPos
������
		�ų��˽ű�ֻΪ��ש����ϣ�����и����˽Ӵ���Lua���о�Lua����ͬ����һ����һ����ħ����
		CG_GMSV_EXPANTIONĿǰ�����Ǻ����ƣ��ܶ��޷�ʵ�ֵĹ��ܣ�����˵�ǲ�ȱ�Ĺ��ܣ���Ҫ������˹�ͬŬ��ȥ��������
		��ӭ�Ȱ�ħ�����Ȱ����о�����һ����д���򡢱�д�ű��ĸ��ֱ��������ۣ�

GMSV Lua QQȺ��14583019

By Ducky�Ώͻ� (QQ:462363)
In 2012.5.24

	require("./data/lua/EasyLuaFunc");
	
--]]

function MSG(strMSG, intColor, intSize)
	if (strMSG=='' or strMSG==nil) then
		return;
	end
	if (intColor=='' or intColor==nil) then
		intColor=4
	elseif (intColor=='��ɫ' or string.lower(intColor)=='white') then
		intColor=0
	elseif (intColor=='��ɫ' or string.lower(intColor)=='blue') then
		intColor=1
	elseif (intColor=='��ɫ' or string.lower(intColor)=='purple') then
		intColor=2
	elseif (intColor=='��ɫ' or string.lower(intColor)=='skyblue') then
		intColor=3
	elseif (intColor=='��ɫ' or string.lower(intColor)=='yellow') then
		intColor=4
	elseif (intColor=='��ɫ' or string.lower(intColor)=='green') then
		intColor=5
	elseif (intColor=='��ɫ' or string.lower(intColor)=='red') then
		intColor=6
	elseif (intColor=='��ɫ' or string.lower(intColor)=='gray') then
		intColor=7
	elseif (intColor=='����ɫ' or string.lower(intColor)=='navyblue') then
		intColor=8
	elseif (intColor=='����ɫ ' or string.lower(intColor)=='darkgreen') then
		intColor=9
	--elseif (intColor>-1 and intColor<10) then
	else
		intColor=intColor
	end
	if (intSize=='' or intSize==nil) then
		intSize=2
	elseif (intSize=='��' or string.lower(intSize)=='big') then
		intSize=3
	elseif (intSize=='��' or string.lower(intSize)=='middle') then
		intSize=2
	elseif (intSize=='С' or string.lower(intSize)=='small') then
		intSize=1
	--elseif (intSize=>1 and intSize<=3) then
	else
		intSize=intSize
	end
	NLG.TalkToCli(-1, "[ȫ������]" ..strMSG,intColor,intSize);
	return ;
end

function Wait(intTime)
	local TM_Time = os.time()
	if (intTime==0 or intTime==nil) then return 'intTime Error' end
	while ((os.time()-TM_Time)<intTime) do end
	return intTime;
end

function Warp(strTxt, rtSub)
	if (strTxt=='' or strTxt==nil or rtSub=='' or rtSub==nil) then
		return "Error Map Pos";
	end
		strTxt=string.gsub(strTxt,"��",",")
		local TM_SuperWarpPos = Split(strTxt,",");
		if (#TM_SuperWarpPos~=3) then
			return "Error Map Pos";
		end
		if (string.lower(rtSub)=='map' or rtSub=='��ͼ') then
			return TM_SuperWarpPos[1];
		elseif (string.lower(rtSub)=='x' or rtSub=='��') then
			return TM_SuperWarpPos[2];
		elseif (string.lower(rtSub)=='y' or rtSub=='��') then
			return TM_SuperWarpPos[3];
		elseif (tonumber(rtSub)>=0) then
			local SuperWarpSuccess = false
			SuperWarpSuccess = NLG.Warp(tonumber(rtSub), 0, tonumber(TM_SuperWarpPos[1]), tonumber(TM_SuperWarpPos[2]), tonumber(TM_SuperWarpPos[3]));
			return SuperWarpSuccess;
		end
end

function ShopItemSplit(strTxt, rtSub)
	if (strTxt=='' or strTxt==nil or rtSub=='' or rtSub==nil) then
		return "Error Shop Data";
	end
	local TM_ShopItem = Split(strTxt,"|")
	local TM_ShopItemID = {}
	local TM_ShopItemNum = {}
	for i,v in pairs(TM_ShopItem) do
		if (math.mod(i,2)==1) then
			TM_ShopItemID[#TM_ShopItemID+1]=v
		else
			TM_ShopItemNum[#TM_ShopItemNum+1]=v
		end
	end
	if (string.lower(rtSub)=='item' or rtSub=='��Ʒ') then
		return TM_ShopItemID;
	elseif (string.lower(rtSub)=='num' or rtSub=='����') then
		return TM_ShopItemNum
	elseif (string.lower(rtSub)=='quantity' or rtSub=='����') then
		return #TM_ShopItemID;
	else
		return {TM_ShopItemID,TM_ShopItemNum,#TM_ShopItemID};
	end
end

function Split(strTxt, strDelim, maxNb)   
    -- Eliminate bad cases...   
    if string.find(strTxt, strDelim) == nil then  
        return { strTxt }  
    end  
    if maxNb == nil or maxNb < 1 then  
        maxNb = 0    -- No limit   
    end  
    local result = {}  
    local pat = "(.-)" .. strDelim .. "()"   
    local nb = 0  
    local lastPos   
    for part, pos in string.gfind(strTxt, pat) do  
        nb = nb + 1  
        result[nb] = part   
        lastPos = pos   
        if nb == maxNb then break end  
    end  
    -- Handle the last field   
    if nb ~= maxNb then  
        result[nb + 1] = string.sub(strTxt, lastPos)   
    end  
    return result   
end  

function EasySQL(strDB, strField, strWhere, strWrite)
	if (strDB=='' or strDB==nil or strField=='' or strField==nil) then
		return "Error SQL Data";
	end
	if (strWhere=='' and strWhere==nil) then
		strWhere=' ';
	else
		strWhere = "WHERE " .. strWhere;
	end
	if (strWrite=='' or strWrite==nil) then
		local TM_strSQL = "SELECT " ..strDB.. "." ..strField.. " from `" ..strDB.. "` " ..strWhere..  " limit 1;";
		print("TM_strSQL��" ..TM_strSQL);
		local TM_tabRS = SQL.Run(TM_strSQL);
		if (type(TM_tabRS)=="table") then
			return TM_tabRS["0_0"];
		else
			return NL.GetErrorStr();
		end
	else
		local TM_strSQL = "UPDATE " ..strDB.. " SET " ..strDB.. "." ..strField.. "=" ..strWrite.. " " ..strWhere..  " limit 1;";
		local TM_tabRS = SQL.Run(TM_strSQL);
		if (type(TM_tabRS)=="table") then
			return "Successful";
		else
			return NL.GetErrorStr();
		end
	end
end

function WalkToPos(intMePtr, intPosX, intPosY, rtSub)
	if (intPosX<0 or intPosX==nil or intPosY<0 or intPosY==nil or rtSub=='' or rtSub==nil or intMePtr=='' or intMePtr==nil) then
		return "Error Pos";
	end
	
	local mePosX = Char.GetData(intMePtr, 5);
	local mePosY = Char.GetData(intMePtr, 6);
	local TM_Dir = -1;
	
	if (string.lower(rtSub)=='distance' or rtSub=='����') then
		return math.abs(math.floor(math.sqrt((mePosX-intPosX)*(mePosX-intPosX)+(mePosY-intPosY)*(mePosY-intPosY))));
	end
	
	if (mePosX==intPosX and mePosY>intPosY) then
		TM_Dir = 0;
	elseif (mePosX<intPosX and mePosY>intPosY) then
		TM_Dir = 1;
	elseif (mePosX<intPosX and mePosY==intPosY) then
		TM_Dir = 2;
	elseif (mePosX<intPosX and mePosY<intPosY) then
		TM_Dir = 3;
	elseif (mePosX==intPosX and mePosY<intPosY) then
		TM_Dir = 4;
	elseif (mePosX>intPosX and mePosY<intPosY) then
		TM_Dir = 5;
	elseif (mePosX>intPosX and mePosY==intPosY) then
		TM_Dir = 6;
	elseif (mePosX>intPosX and mePosY>intPosY) then
		TM_Dir = 7;
	elseif (mePosX==intPosX and mePosY==intPosY) then
		TM_Dir = -1;
	end
	
	if (string.lower(rtSub)=='dir' or rtSub=='����') then
		return TM_Dir;
	elseif (string.lower(rtSub)=='walk' or rtSub=='�߶�') then
		NLG.WalkMove(intMePtr,TM_Dir);
	end
	
end
