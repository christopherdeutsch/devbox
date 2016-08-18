#
# install some packages
#
package_groups = %w(editor build)

package_groups.each do |package_group|
  node['devbox']['packages'][package_group].each do |p|
    package p
  end
end
