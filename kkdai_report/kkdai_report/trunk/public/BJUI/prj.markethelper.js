var tokenid='';
		function loginChk(formData, jqForm, options){  
			//formData: ��������ύ��ʱ��Form�������Ajax��ʽ�Զ��ύ��Щ���ݣ���ʽ�磺[{name:user,value:val },{name:pwd,value:pwd}]  var queryString = $.param(formData);   //name=1&address=2  
			//jqForm:   jQuery���󣬷�װ�˱���Ԫ��     
			//options:  options����
			var form = jqForm[0];
			if(!form.username.value || !form.password.value){
				alert('�������û���������');
				return false;
			}else return true;
		}  

		function loginRet(response, statusText){  
//			//dataType=xml  
//			var name = $('name', responseXML).text();  
//			var address = $('address', responseXML).text();  
//			$("#xmlout").html(name + "  " + address);  
			//dataType=json  
			if(response.result=='ok'){
				tokenid=response.token;
				//$("#frmSearch").token.value=response.token;
				$("#divLogin").hide();
				$("#divSearch").show();
			}else{
				alert(response.result);
			}
		}
	   
		function searchChk(formData, jqForm, options)
		{
			var form = jqForm[0];
			if(!form.phone.value){
				alert('�������ֻ���');
				return false;
			}else return true;
		}
		function fillToken(form, options)
		{
			options['data']['token']=tokenid;
			return true;
		}
		function searchRet(response, statusText)
		{
			if(response.result=='timeout'){
				alert('��ʱ�������µ���');
				$("#divLogin").show();
				$("#divSearch").hide();
				return;
			}
			if(response.result=='ok'){
				//$("#frmSearch").asdf.value=response.token;
				$('#divSearchRet').html('['+(response.bindok==1?'�Ѱ�':'δ��')+']ע�����ڣ�'+response.ymdreg);
			}else{
				alert('ϵͳ����' + response.result);
			}
		}
		$(document).ready(function () {
			$("#frmLogin").ajaxForm(
				{  
				//target: '#output',          //�ѷ��������ص����ݷ���idΪoutput��Ԫ����      
				beforeSubmit: loginChk,  //�ύǰ�Ļص�����  
				success: loginRet,      //�ύ��Ļص�����  
				//url: url,                 //Ĭ����form��action�� �����������Ḳ��  
				//type: type,               //Ĭ����form��method��get or post���������������Ḳ��  
				dataType: 'json',           //html(Ĭ��), xml, script, json...���ܷ���˷��ص����� 
				//clearForm: true,          //�ɹ��ύ��������б�Ԫ�ص�ֵ  
				//resetForm: true,          //�ɹ��ύ���������б�Ԫ�ص�ֵ  
				timeout: 3000               //���������ʱ�䣬���������3�����������  
				}
			);
			$("#frmSearch").ajaxForm(
				{  
				//target: '#output',          //�ѷ��������ص����ݷ���idΪoutput��Ԫ����      
				beforeSubmit: searchChk,  //�ύǰ�Ļص�����  
				success: searchRet,      //�ύ��Ļص�����  
				beforeSerialize:fillToken,
				data:{},
				//url: url,                 //Ĭ����form��action�� �����������Ḳ��  
				//type: type,               //Ĭ����form��method��get or post���������������Ḳ��  
				dataType: 'json',           //html(Ĭ��), xml, script, json...���ܷ���˷��ص����� 
				//clearForm: true,          //�ɹ��ύ��������б�Ԫ�ص�ֵ  
				//resetForm: true,          //�ɹ��ύ���������б�Ԫ�ص�ֵ  
				timeout: 3000               //���������ʱ�䣬���������3�����������  
				}
			);
		});