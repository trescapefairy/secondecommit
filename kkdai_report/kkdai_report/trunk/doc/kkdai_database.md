## 报表系统数据表 ##
| 表名   | 描述   
|-                      |
| tb_bankcard_final     | 绑卡表
| tb_evtdaily           | 日常数据表
| tb_orders_final       | 订单表（包含天天赚订单）
| tb_packet_water       | 红包流水表
| tb_products_final     | 产品表（包含天天赚产品）
| tb_recharges_final    | 充值提现表
| tb_vouchers_final     | 券表
| tb_yuebao_out         | 天天赚转出流水表
| tb_user_final         | 用户表


## 快快生产从库表 ##
| 表名   | 描述   
|-    |     
| account_card_binding  | 绑卡表
| customer              | 客户基本信息表
| account_info          | 客户账户信息
| account_packet        | 客户红包信息表
| ustomer_coupon        | 客户优惠券表
| yuebao_customer       | 客户余额宝投资收益表
| bid                   | 产品标的表
| bid_poi               | 投标明细表
| customer_invite       | 客户邀请表
| invite_finance        | 
| yuebao_poi            | 余额宝投标明细表



# 快快贷状态转换 #

## 状态转换目的 ##
	在报表系统中，将快快贷中的各种状态转和喵叽中相同状态的状态码保持一致。
	有利于管理和统计数据。

## 绑卡表（tb_bankcard_final） ##
	字段：resultStatus
	描述：绑卡失败的状态
### 喵叽绑卡状态 ###
| 状态码	| 描述
| -		| -
| -1		| 放弃的
| 0		| 待验证
| 4		| 禁用的
| 16	| 启用的
### 快快贷现在目前找到的绑卡状态 ###
| 状态码 | 描述
| -		| - 	
| -4		| 网络错误,请稍后再试!
| -4		| 网络错误
| 2		| 两次请求间隔太短
| 2		| 交易失败
| 2		| 交易失败，请咨询您的发卡行
| 2		| 卡bin校验银行卡类型不正确
| 2		| 卡不支持请换卡重试
| 2		| 卡号不符
| 2		| 卡号与卡类型不匹配！
| 2		| 卡号与银行不匹配
| 2		| 卡号无效
| 2		| 卡状态异常或户名证件号不符
| 2		| 实名信息与银行预留信息不匹配
| 2		| 客户号与登陆客户号不一致
| 2		| 户名不符
| 2		| 手机号不正确/不合法或与银行柜台预留不符
| 2		| 持卡人身份信息、手机号或其它信息输入不正确
| 2		| 持卡人身份信息或手机号输入不正确
| 2		| 提交成功
| 2		| 暂不支持该银行
| 2		| 有效期或CVN2有误
| 2		| 短信验证码长度不超过6
| 2		| 系统繁忙，请您稍后重试！
| 2		| 绑卡失败
| 2		| 证件类型/证件号码不正确或与银行绑定证件不符
| 2		| 请重新签约
| 2		| 超出验证次数
| 2		| 鉴权失败，请咨询您的发卡行
| 2		| 银行卡信息校验失败，请核实您的银行卡信息！
| 2		| 银行卡号格式错误
| 2		| 银行卡未开通认证支付
| 2		| 银行卡状态异常
| 2		| 银行卡签约推进失败
| 2		| 银行卡类型(借记卡/贷记卡)不正确
| 2		| 银行系统异常
| 2		| 验证码已失效，请重新获取验证码
| 2		| 验证码错误
| 3		| null

### 转换结果 ###
	tb_bankcard_final中
	快快贷到RPT的绑卡数据 只写了绑卡失败的状态，失败的状态码目前都按照快快的失败状态和描述

## 用户表（tb_user_final） ##
	字段：flagUser
	说明：用户类型
| flagUser	| 描述	
| -			| 
| 0 		| 普通用户	
| 1 		| 超级用户
| 2 		| 内部员工
| 3 		| 推荐用户	
	转换结果：不需要转换

## 订单表（tb_orders_final） ##
	字段：shelfId, type, orderStatus, firstTime, firstTimeInAll, returnType,
	说明
	shelfId:		产品类型
	type:			天天赚的状态，1 投入， 2 利息复投
	orderStatus:	订单的状态
	firstTime: 		是不是用户在此类标的的第一个订单（1 是，0 否。 天天赚为一类，其他为另一类）
	firstTimeInAll: 是不是该用户所有订单中的第一单 1 是， 0 否。
	returnType: 	还款计划
### 产品类型 ###
| shelfId		| 描述	
| - 			| - 	
| 0				| 天天赚
| 1				| 定期宝
| 2				| 房宝宝
| 2000			| 固定收益产品类型
| 3000			| 固定+浮动产品类型
| 4000 			| 浮动产品类型

### 喵叽中的订单类型 ###
| orderType	| 说明	
| - 			| - 	
| 10 			| 投资
| 20 			| 充值
| 30			| 提现
| 40			| 回款
| 70			| 绑卡
| 90			| 券

### 喵叽中的订单状态码 ###
| orderStatus	| 说明	
| - 			| - 	
| 0 			| 初建（保留）
| -1 			| 中断，废弃的（系统状态）
| 4				| 支付失败
| 2				| 订单已受理，等待处理结果
| 3 			| 订单已受理，等待支付网关处理结果
| 8 			| 支付成功,起息前
| 10 			| 起息后，回款中
| 21 			| 正常回款（延期由平台垫付）
| 20 			| 延期回款中 
| 38 			| 提前还款
| 39 			| 结束：已全部回款，提现成功，充值成功
| 37			| 充值订单专用:成功充值，但需要更新用户的钱包余额


### 快快贷中订单表（bid_poi）的订单状态 ###
| poi_status	| 说明 
|- 				| 
| 600 			| 等待支付
| 601 			| 支付成功
| 602 			| 支付失败
| 603 			| 放款成功
| 604			| 处理中
| 606			| 等待退款
| 607			| 退款成功
| 608			| 投标失败
| 610			| 已还清
| 609			| 流标


	
	转换结果(status => orderStatus)： 只抓取成功的订单所以，只转换成功的状态码。
	601 => 8
	603 => 10
	610 => 39
	天天赚成功的订单orderStatus全部为 8.

## 产品表（tb_products_final） ##

### 喵叽中产品状态 ###
| 状态码		| 说明	
| - 		| - 
| -2			| 正式上架后撤销的
| -1			| 没正式上架的撤销的
| 0			| 新建
| 10		| 等待上架
| 11		| 上架募集中
| 12		| 募集结束，等待还款
| 20		| 还款结束
### 快快贷中产品状态 ###
| 状态码		| 说明
| - 		| - 
| 4002		| 已申请
| 4003		| 提交
| 4004 		| 已复核
| 4005 		| 已终审
| 5000		| 标的初建
| 5001		| 新建
| 5002		| 招标中
| 5003		| 满标
| 5004 		| 还款中
| 5005		| 标的已还款已还清
| 5006		| 待发布
| 5007		| 流标处理中
| 5008		| 逾期
| 4011		| 已流标

	转换结果（bid_status=>statusType）
	5001 => 0
	5002 => 11
	5003 => 12
	5004 => 12
	5005 => 20
	5006 => 10
	其他状态未转换
	

### 快快贷标的类型 ###
| 类型码		| 说明
|- 			| 		
| 501		| 体验标
| 502 		| 信用标
| 503		| 实地标-抵押标
| 504		| 抵押标
| 505 		| 抵押标
	转换结果 (bid_type => mainType)
	标的类型bid_type没有转换直接存放到tb_products_final 的mainType字段

### 喵叽中的还款计划类型 ###
| returnType	| 说明	
| - 			| - 
| 0 			| 待定
| 1				| 一次性还本息
| 2 			| 先息后本
### 快快贷中还款计划类型 ###
| bid_interest_type | 说明
|- 					| - 
| 303				| 先息后本
| 302				| 一次性本息
	转换结果（bid_interest_type => mainType）
	303 => 2
	302 => 1
	null => 0

## 券(tb_voucher_final) ##
### 喵叽券类型 ###
| 类型码		| 说明
|- 			| 		
| 32		| 用来分享的红包
| 16		| 返利券 ？？？
| 8 		| 红包
| 4			| 抵现券
| 2			| 加息券

### 快快贷券类型  ###
| 类型码		| 说明
|- 			| 		
| 1			| 抵现券
| 2 		| 加息券
| 3			| 返现券
| 4			| 提现券
	转换结果 (type => voucherType)
	暂未转换	

### 喵叽券使用状态###
| 类型码		| 说明
|- 			| 		
| -2			| 等待激活 
| 1 		| 已使用
| 0			| 未使用
| -1			| 废弃

### 快快贷券使用状态 ###
| 类型码		| 说明
|- 			| 		
| 0			| 未使用
| 1 		| 已使用
	转换结果（status => status）
	不需转换


## 注意事项 ##
### 旧格式的渠道 ###
    背景：
    原来快快贷渠道的区分是使用一个渠道的名称的拼音或英文进行区分。现在统一使用18位的数字来表示。
    为此要把老格式的渠道表示 转换成 18位的数字。
    
    举例说明：如果一个老格式的渠道名称是"hollywood"，现在要转换成新的渠道协议
    1. 首先在快快贷报表系统中的渠道转换查找此老格式的渠道是不是已经转换了。如果是就不用进行以下步骤
    2. 为此老格式的渠道分配一个4位的渠道号。在报表系统的渠道管理中进行分配
    3. 在报表系统中的协议管理中为hollywood分配一个协议号，所属渠道是上一步分配的渠道。
    4. 在渠道转换菜单中的新增按钮，将hollywood极其分配的协议号添加到数据库。
    5. 完毕
    
    注意： 渠道转换中，老的渠道名称末尾有个别有多个空格的。