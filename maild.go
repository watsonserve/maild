package maild

import (
	"container/list"
	"strings"
)

// mail access structor
type Mas struct {
	Sess    string
	Tag     string
	Command string
	Parames string
}

func InitMas(sess, msg string) *Mas {
	raw := strings.SplitN(msg, " ", 3)
	length := len(raw)
	if length < 2 {
		return nil
	}
	ret := &Mas{
		Sess:    sess,
		Tag:     raw[0],
		Command: raw[1],
		Parames: "",
	}
	if 2 < length {
		ret.Parames = raw[2]
	}

	return ret
}

// 配置
type ServerConfig struct {
	Domain  string
	Ip      string // 服务器的IP
	Name    string
	Type    string
	Version string
}

type KV struct {
	Name  string
	Value string
}

type Mail struct {
	Sender      string
	Recver      list.List
	Head        []KV
	MailContent string
}
