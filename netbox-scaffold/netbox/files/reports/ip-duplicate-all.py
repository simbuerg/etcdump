from ipam.choices import IPAddressRoleChoices
from ipam.models import IPAddress, Prefix
from extras.reports import Report
from django.db.models import Q

# UniqueIPReport was forked from https://gist.github.com/dgarros/acc23b4fd8d42844b8a41f695e6cb769
class UniqueIPReportAll(Report):
    description = "Validate that we don't have an IP address allocated multiple times in the network"

    def test_unique_ip(self):
        already_found = set()
        for ip in IPAddress.objects:
            if ip.address in already_found:
                continue
            duplicates = ip.get_duplicates()
            real_dup = len(duplicates)
            if real_dup != 0:
                already_found.add(ip.address)
                msg = "has %s duplicate ips" % real_dup
                self.log_failure( ip, msg )
