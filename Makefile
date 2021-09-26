.DEFAULT_GOAL := run

clean:
	rm -f channel.zip

channel.zip:
	zip -q -9 -r channel.zip components source manifest

run: clean channel.zip
	sideload -v -h rult.rpc.lcl -u rokudev -p admin -f channel.zip
