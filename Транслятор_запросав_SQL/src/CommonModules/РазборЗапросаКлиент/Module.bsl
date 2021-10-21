//|--Clustered Index Seek(OBJECT:([bespalov_trade].[dbo].[_AccumRgT9212].[_AccumRgT9212_1] AS [T11]), 
//SEEK:([T11].[_Fld10758]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld10758] as [T11].[_Fld10758] 
//AND [T11].[_Period]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Period] as [T11].[_Period] 
//AND [T11].[_Fld9207RRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9207RRef] as [T11].[_Fld9207RRef] 
//AND [T11].[_Fld29002_TYPE]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld29002_TYPE] as [T11].[_Fld29002_TYPE] 
//AND [T11].[_Fld29002_RTRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld29002_RTRef] as [T11].[_Fld29002_RTRef] 
//AND [T11].[_Fld29002_RRRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld29002_RRRef] as [T11].[_Fld29002_RRRef] 
//AND [T11].[_Fld9204_TYPE]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9204_TYPE] as [T11].[_Fld9204_TYPE] 
//AND [T11].[_Fld9204_RTRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9204_RTRef] as [T11].[_Fld9204_RTRef] 
//AND [T11].[_Fld9204_RRRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9204_RRRef] as [T11].[_Fld9204_RRRef] 
//AND [T11].[_Fld9205RRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9205RRef] as [T11].[_Fld9205RRef] 
//AND [T11].[_Fld9206RRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9206RRef] as [T11].[_Fld9206RRef] 
//AND [T11].[_Fld20685RRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld20685RRef] as [T11].[_Fld20685RRef] 
//AND [T11].[_Fld9208RRef]=[bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9208RRef] as [T11].[_Fld9208RRef]),  
//WHERE:(([bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9209] as [T11].[_Fld9209]<CONVERT_IMPLICIT(numeric(21,3),[@P45],0) 
//OR [bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9209] as [T11].[_Fld9209]>CONVERT_IMPLICIT(numeric(21,3),[@P45],0)) 
//AND ([bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9209] as [T11].[_Fld9209]<CONVERT_IMPLICIT(numeric(21,3),[@P46],0) 
//OR [bespalov_trade].[dbo].[_AccumRgT9212].[_Fld9209] as [T11].[_Fld9209]>CONVERT_IMPLICIT(numeric(21,3),[@P46],0))) 
//LOOKUP ORDERED FORWARD)              

//Hash Match(Right Outer Join, HASH:([T2].[_IDRRef])=([T1].[_Fld48953_RRRef]), 
//RESIDUAL:([bespalov_trade].[dbo].[_InfoRg48951].[_Fld48953_RRRef] as [T1].[_Fld48953_RRRef]=[bespalov_trade].[dbo].[_Document48976].[_IDRRef] as [T2].[_IDRRef] 
//AND [bespalov_trade].[dbo].[_InfoRg48951].[_Fld48953_TYPE] as [T1].[_Fld48953_TYPE]=0x08
//AND [bespalov_trade].[dbo].[_InfoRg48951].[_Fld48953_RTRef] as [T1].[_Fld48953_RTRef]=0x0000BF50))

//|--Clustered Index Seek(OBJECT:([bespalov_trade].[dbo].[_InfoRg48951].[_InfoRg48951_1] AS [T1]), 
//SEEK:([T1].[_Fld10758]=[@P2] AND [T1].[_Fld48952] > [Expr1008] AND [T1].[_Fld48952] < [Expr1009]),  
//WHERE:([bespalov_trade].[dbo].[_InfoRg48951].[_Fld48954RRef] as [T1].[_Fld48954RRef]=[@P5] 
//AND [bespalov_trade].[dbo].[_InfoRg48951].[_Fld48955RRef] as [T1].[_Fld48955RRef]=[@P6]) ORDERED FORWARD)  
                                                    
Функция РазобратьПланЗапроса(ТекстSQL) Экспорт
	Текст1С= "";
	
	Возврат Текст1С;
КонецФункции