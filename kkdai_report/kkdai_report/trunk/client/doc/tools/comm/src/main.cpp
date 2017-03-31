#include "Utils.h"
#include "Send.h"
#include "Enum.h"

vector< CEnum* > g_vEnums;
vector< CSend* > g_vSends;

void parseEnums( tinyxml2::XMLElement* node );
void parseSends( tinyxml2::XMLElement* node );
void genEnums( const string& dir );
void genSends( const string& dir );
void genEnumsOc( const string& dir );
void genEnumsSwift( const string& dir );
void genEnumsJava( const string& dir );
void genSendsOc( const string& dir );
void genSendsSwift( const string& dir );
void genSendsJava( const string& dir );
int main( int argc, char** argv )
{
	if ( argc < 3 )
	{
		cout<<"usage:dic2comm input_file output_dir"<<endl;
		return -1;
	}

	tinyxml2::XMLDocument doc;
	int err = doc.LoadFile( argv[1] );
	if ( tinyxml2::XML_NO_ERROR != err )
	{
		cout<<"load file:"<<argv[1]<<" failed, error code:"<<err<<endl;
		return -2;
	}

	for ( tinyxml2::XMLElement* root = doc.RootElement(); NULL != root; root = root->NextSiblingElement() )
	{
		string name = root->Name();
		if ( "enums" == name )
		{
			parseEnums( root );
		}
		else if ( "sends" == name )
		{
			parseSends( root );
		}
	}

	genEnums( argv[2] );
	genSends( argv[2] );
	return 0;
}
void parseEnums( tinyxml2::XMLElement* node )
{
	for ( tinyxml2::XMLElement* child = node->FirstChildElement(); NULL != child; child = child->NextSiblingElement() )
	{
		string name = child->Name();
		if ( "enum" == name )
		{
			CEnum* p = new CEnum;
			p->parse( child );
			g_vEnums.push_back(p);
		}
	}
}
void parseSends( tinyxml2::XMLElement* node )
{
	for ( tinyxml2::XMLElement* child = node->FirstChildElement(); NULL != child; child = child->NextSiblingElement() )
	{
		string name = child->Name();
		if ( "send" == name )
		{
			CSend* p = new CSend;
			p->parse( child );
			g_vSends.push_back(p);
		}
	}
}
void genEnums( const string& dir )
{
	genEnumsOc( dir );
	genEnumsSwift( dir );
	genEnumsJava( dir );
}
void genSends( const string& dir )
{
	genSendsOc( dir );
	genSendsSwift( dir );
	genSendsJava( dir );
}
void genEnumsOc( const string& dir )
{
	string file = dir + "/comm_enums.h";
	ofstream fout( file.data() );
	if ( !fout.is_open() )
	{
		cout<<"open file:"<<file<<" failed!"<<endl;
		return ;
	}

	fout<<"//This file is generated by dic2comm. Don't modify it."<<endl;
	fout<<"#ifndef _COMM_ENUMS_H_"<<endl;
	fout<<"#define _COMM_ENUMS_H_"<<endl;
	fout<<endl;

	for ( size_t i=0; i<g_vEnums.size(); ++i )
	{
		g_vEnums[i]->genForOc( fout );
	}

	fout<<endl;
	fout<<"#endif //_COMM_ENUMS_H_"<<endl;
}
void genEnumsSwift( const string& dir )
{
	string file = dir + "/comm_enums.swift";
	ofstream fout( file.data() );
	if ( !fout.is_open() )
	{
		cout<<"open file:"<<file<<" failed!"<<endl;
		return ;
	}
	
	fout<<"//This file is generated by dic2comm. Don't modify it."<<endl;
	fout<<endl;
	
	for ( size_t i=0; i<g_vEnums.size(); ++i )
	{
		g_vEnums[i]->genForSwift( fout );
	}
}
void genEnumsJava( const string& dir )
{
	string file = dir + "/comm_enums.java";
	ofstream fout( file.data() );
	if ( !fout.is_open() )
	{
		cout<<"open file:"<<file<<" failed!"<<endl;
		return ;
	}
	
	fout<<"//This file is generated by dic2comm. Don't modify it."<<endl;
	fout<<"package com.kuaikuaidai.kkdaireport.comm;"<<endl;
	fout<<endl;

	fout<<"public class CONSTANT {"<<endl;
	for ( size_t i=0; i<g_vEnums.size(); ++i )
	{
		g_vEnums[i]->genForJava( fout );
	}
	fout<<"}"<<endl;
	fout.close();
}
void genSendsOc( const string& dir )
{
	{
		string file = dir + "/CommSender.h";
		ofstream fout( file.data() );
		if ( !fout.is_open() )
		{
			cout<<"create file:"<<file<<" failed"<<endl;
			return ;
		}
		fout<<"//This file is generated by dic2comm. Don't mofity it."<<endl;
		fout<<"#ifndef _COMM_SENDER_H_"<<endl;
		fout<<"#define _COMM_SENDER_H_"<<endl;
		fout<<endl;
		
		fout<<"@interface CommSender : NSObject"<<endl;
		for ( size_t i=0; i<g_vSends.size(); ++i )
		{
			CSend* send = g_vSends[i];
			fout<<"	//"<<send->getDesc()<<endl;
			send->genForOcHeader( fout );
			fout<<endl;
		}
		fout<<endl;

		fout.close();
	}
	{
		string file = dir + "/CommSender.mm";
		ofstream fout( file.data() );
		if ( !fout.is_open() )
		{
			cout<<"create file:"<<file<<" failed"<<endl;
			return ;
		}
		fout<<"//This file is generated by dic2comm. Don't mofity it."<<endl;
		fout<<"#include \"CommSender.h\""<<endl;
		fout<<endl;
		
		fout<<"@implementation CommSender"<<endl;
		for ( size_t i=0; i<g_vSends.size(); ++i )
		{
			CSend* send = g_vSends[i];
			fout<<"	//"<<send->getDesc()<<endl;
			send->genForOcMM( fout );
			fout<<endl;
		}
		fout<<endl;
		
		fout<<"@end"<<endl;

		fout.close();
	}
}
void genSendsSwift( const string& dir )
{
	{
		string file = dir + "/CommSender.swift";
		ofstream fout( file.data() );
		if ( !fout.is_open() )
		{
			cout<<"create file:"<<file<<" failed"<<endl;
			return ;
		}
		fout<<"//This file is generated by dic2comm. Don't mofity it."<<endl;
		fout<<"import Foundation"<<endl;
		fout<<"import UIKit"<<endl;
		fout<<endl;
		
		fout<<"class CommSender"<<endl;
		fout<<"{"<<endl;
		for ( size_t i=0; i<g_vSends.size(); ++i )
		{
			CSend* send = g_vSends[i];
			send->genForSwift( fout );
			fout<<endl;
		}
		fout<<endl;
	
		fout<<"}"<<endl;

		fout.close();
	}
}
void genSendsJava( const string& dir )
{
	string file = dir + "/CommSender.java";
	ofstream fout( file.data() );
	if ( !fout.is_open() )
	{
		cout<<"create file:"<<file<<" failed"<<endl;
		return ;
	}
	fout<<"//This file is generated by dic2comm. Don't mofity it."<<endl;
	fout<<"package com.kuaikuaidai.kkdaireport.comm;"<<endl;
	fout<<"import android.content.Context;"<<endl;
	fout<<"import java.util.HashMap;"<<endl;
	fout<<endl;
	
	fout<<"class CommSender {"<<endl;
	for ( size_t i=0; i<g_vSends.size(); ++i )
	{
		CSend* send = g_vSends[i];
		send->genForJava( fout );
		fout<<endl;
	}
	fout<<endl;
	
	fout<<"}"<<endl;

	fout.close();
}